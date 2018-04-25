class ReservationsController < ApplicationController
  before_action :authenticate_traveler!
  before_action :set_reservation, only: [:approve, :decline]

  #create a reservation
  def create
    tour = Tour.find(params[:tour_id])

    if current_traveler == tour.traveler
      flash[:alert] = "You can't book your own tour!"
    elsif current_traveler.stripe_id.blank?
      flash[:alert] = "Please update your payment method."
      return redirect_to payment_method_path
    else
      start_date = Date.parse(reservation_params[:start_date])

      @reservation = current_traveler.reservations.build(reservation_params)
      @reservation.tour = tour
      @reservation.price = tour.price
      @reservation.total = tour.price * tour.duration
      @reservation.duration = tour.duration
      #@reservation.save
      if @reservation.Waiting!
        # there was an extra space before .Request
        if tour.Request?
          flash[:notice] = "Request sent successfully!"
        else
          #@reservation.Approved!
          charge(tour, @reservation)
          flash[:notice] = "Reservation created successfully!"
        end
      else
        flash[:alert] = "Cannot make a reservation!"
      end

    end
    redirect_to tour
  end

  #show all your trips
  def your_trips
    @trips = current_traveler.reservations.order(start_date: :asc)
  end

  #show all your reservations for your tours
  def your_reservations
    @tours = current_traveler.tours
  end

  #approve a reservation request
  def approve
    # charge(tour, @reservation)
    @reservation.Approved!
    redirect_to your_reservations_path
  end

  #reject a reservation request
  def decline
    @reservation.Declined!
    redirect_to your_reservations_path
  end

  private

    #charge when a booking is instant
    def charge(tour, reservation)
      if !reservation.traveler.stripe_id.blank?
        customer = Stripe::Customer.retrieve(reservation.traveler.stripe_id)
        charge = Stripe::Charge.create(
          :customer => customer.id,
          :amount => reservation.total * 100, #since stripe counts as cents
          :description => tour.title,
          :currency => "usd",
          # :destination => {
          #   :amount => reservation.total * 80, # 80% of the total amount goes to the Host
          #   :account => tour.traveler.merchant_id # Host's Stripe customer ID
          # }
        )

        if charge
          reservation.Approved!
          flash[:notice] = "Reservation created successfully!"
        else
          reservation.Declined!
          flash[:alert] = "Reservations unsuccessful: payment did not go through."
        end
      end
    rescue Stripe::CardError => e
      reservation.declined!
      flash[:alert] = e.message
    end

    #find a reservation based on id
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    #define the paramaters for a reservations
    def reservation_params
      params.require(:reservation).permit(:start_date)
    end
end

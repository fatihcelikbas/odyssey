class ReservationsController < ApplicationController
  before_action :authenticate_traveler!
  before_action :set_reservation, only: [:approve, :decline]
  
  def create
    tour = Tour.find(params[:tour_id])
    
    if current_traveler == tour.traveler
      flash[:alert] = "You can't book your own tour!"
    else
      start_date = Date.parse(reservation_params[:start_date])
      
      @reservation = current_traveler.reservations.build(reservation_params)
      @reservation.tour = tour
      @reservation.price = tour.price
      @reservation.total = tour.price * tour.duration
      @reservation.duration = tour.duration 
      #@reservation.save
      if @reservation.save
        if tour .Request?
          flash[:notice] = "Request sent successfully!"
        else
          @reservation.Approved!
          flash[:notice] = "Reservation created successfully!"
        end
      else
        flash[:alert] = "Cannot make a reservation!"
      end
      
    end
    redirect_to tour
  end
  
   def your_trips
    @trips = current_traveler.reservations.order(start_date: :asc)
  end
  
  def your_reservations
    @tours = current_traveler.tours
  end
  
  def approve
    @reservation.Approved!
    redirect_to your_reservations_path
  end

  def decline
    @reservation.Declined!
    redirect_to your_reservations_path
  end

  
  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
    def reservation_params
      params.require(:reservation).permit(:start_date)
    end
end
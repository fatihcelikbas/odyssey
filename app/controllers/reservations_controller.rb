class ReservationsController < ApplicationController
  before_action :authenticate_traveler!
  
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
      @reservation.save
      
      flash[:notice] = "Booked successfully!"
    end
    redirect_to tour
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:start_date)
    end
end
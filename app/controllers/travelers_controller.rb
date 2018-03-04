class TravelersController < ApplicationController
    def show
        @traveler = Traveler.find(params[:id])
        @tours = @traveler.tours
    end
end
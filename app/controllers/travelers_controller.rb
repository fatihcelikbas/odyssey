class TravelersController < ApplicationController
    def show
        @traveler = Traveler.find(params[:id])
    end
end
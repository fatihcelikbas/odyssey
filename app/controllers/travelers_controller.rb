class TravelersController < ApplicationController
    def show
        @traveler = Traveler.find(params[:id])
        
        # Display all the tourist reviews to guide (if this traveler is a guide)
        @tourist_reviews = Review.where(type: "TouristReview", guide_id: @traveler.id)
        
        # Display all the guide reviews to tourist (if this traveler is a tourist)
        @guide_reviews = Review.where(type: "GuideReview", tourist_id: @traveler.id)
        
    end
end
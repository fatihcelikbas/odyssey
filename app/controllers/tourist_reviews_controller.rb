class TouristReviewsController < ApplicationController
    
    def create
        
        @reservation = Reservation.where(
                        id: tourist_review_params[:reservation_id],
                        tour_id: tourist_review_params[:tour_id]
                        ).first
        
        if !@reservation.nil? && @reservation.tour.traveler.id == tourist_review_params[:guide_id].to_i
           
           @has_reviewed = TouristReview.where(
                                reservation_id: @reservation.id,
                                guide_id: tourist_review_params[:guide_id]
                            ).first
            
            if @has_reviewed.nil?
                # Allow to review
                
                @tourist_review = current_traveler.tourist_reviews.create(tourist_review_params)
                flash[:success] = "Review created..."
            else
                # Already reviewed
                flash[:success] = "Already reviewed"
            end
        
        else
            flash[:alert] = "Reservation not found"
        end
        
        redirect_back(fallback_location: request.referer)
    end
    
    def destroy
       @tourist_review = Review.find(params[:id])
       @tourist_review.destroy
       
       redirect_back(fallback_location: request.referer, notice: "Removed...!")
    end
    
    
    private
        def tourist_review_params
           params.require(tourist_review).permit(:comment, :star, :tour_id, :reservation_id, :guide_id) 
        end
end
class GuideReviewsController < ApplicationController
    
    def create
        
        @reservation = Reservation.where(
                        id: guide_review_params[:reservation_id],
                        tour_id: guide_review_params[:tour_id],
                        traveler_id: guide_review_params[:tourist_id]
                        ).first
        
        if !@reservation.nil?
           
           @has_reviewed = GuideReview.where(
                                reservation_id: @reservation.id,
                                tourist_id: guide_review_params[:tourist_id]
                            ).first
            
            if @has_reviewed.nil?
                
                # Allow to review
                @guide_review = current_traveler.guide_reviews.create(guide_review_params)
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
       @guide_review = Review.find(params[:id])
       @guide_review.destroy
       
       redirect_back(fallback_location: request.referer, notice: "Removed...!")
    end
    
    
    private
        def guide_review_params
           params.require(:guide_review).permit(:comment, :star, :tour_id, :reservation_id, :tourist_id) 
        end
end
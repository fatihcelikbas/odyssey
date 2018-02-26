class PhotosController < ApplicationController
    
    def create
        @tour = Tour.find(params[:tour_id])
        
        if params[:images]
            params[:images].each do |img|
                @tour.photos.create(image: img)
            end
            
            @photos = @tour.photos
            redirect_back(fallback_location: request.referer, notice: "Saved...")
            
        end
        
        def destroy
           
           @photo = Photo.find(params[:id])
           tour = @photo.tour
           
           @photo.destroy
           @photos = Photo.where(tour_id: tour.id)
           
           respond_to :js
        end
        
    end
end
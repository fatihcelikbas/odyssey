class ToursController < ApplicationController
  before_action :set_tour, except: [:index, :new, :create]
  before_action :authenticate_traveler!, except: [:show]
  before_Action :is_authorised only: [:listing, :pricing, :description, :photo_upload, :features, :location, :update]
  
  #get the tours of the traveler
  def index
    @tours = current_traveler.tours
  end

  def new
    @tour = current_traveler.tours.build
  end

  #create a new tour
  def create
    @tour = current_traveler.tours.build(tour_params)
    if @tour.save
      redirect_to listing_tour_path(@tour), notice: "Saved..."
    else
      flash[:alert] = "Unfortunately something went wrong..."
      render :new
    end
  end

  def show
  end
  
  def listing

  end

  def pricing

  end

  def description

  end
  
  def photo_upload
    
    @photos = @tour.photos
    
  end

  def features

  end

  def location

  end

  #update a field
  def update
    
    new_params = tour_params
    new_params = tour_params.merge(active: true) if is_ready_tour
    if @tour.update(new_params)
      flash[:notice] = "Saved"
    else
      flash[:alert] = "Unfortunately something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end
  
  #shorthand method
  private
    def set_tour
      @tour = Tour.find(params[:id])
    end
    
    def is_authorised
      redirect_to root_path, alert: "You don't have permission" unless current_traveler.id == @tour.traveler_id
    end
    
    def tour_params
      params.require(:tour).permit(:price, :duration, :max_persons, :title, :description, :city, :is_outdoors, :is_nightlife, :is_foodie, :is_daytrip, :is_landmarks, :is_museums, :active)
    end
    
    def is_ready_tour
      !@tour.active && !@tour.price.blank? && !@tour.title.blank? && !@tour.city.blank?
    end
end
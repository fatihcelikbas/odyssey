class ToursController < ApplicationController
  before_action :set_tour, except: [:index, :new, :create]
  before_action :authenticate_guide!, except: [:show]
  
  #get the tours of the guide
  def index
    @tours = current_guide.tours
  end

  def new
    @tour = current_guide.tours.build
  end

  #create a new tour
  def create
    @tour = current_guide.tours.build(tour_params)
    if @tour.save
      redirect_to listing_tour_path(@tour), notice: "Saved..."
    else
      render :new, notice: "Unfortunately something went wrong..." 
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

  def features

  end

  def location

  end

  #update a field
  def update
    if @tour.update(tour_params)
      flash[:notice] = "Saved"
    else
      flash[:notice] = "Unfortunately something went wrong..."
    end
    redirect_back(fallback_location: request_referer)
  end
  
  #shorthand method
  private
    def set_tour
      @tour = Tour.find(params[:id])
    end
    
    def tour_params
      params.require(:tour).permit( :duration, :max_persons, :title, :description, :city, :is_outdoors, :is_nightlife, :is_foodie, :is_daytrip, :is_landmarks, :is_museums, :active)
    end
end
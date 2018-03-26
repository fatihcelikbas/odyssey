class PagesController < ApplicationController
  def home
    @tours = Tour.where(active: true).limit(3)
  end

  def search
    # STEP 1, save the search
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
      @location = Geocoder.coordinates(session[:loc_search])
    end

    # STEP 2, find nearby tours
    if session[:loc_search] && session[:loc_search] != ""
      @tours_address = Tour.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @tours_address = Tour.where(active: true).all
    end

    # STEP 3, store tours in our array
    @search = @tours_address.ransack(params[:q])
    @tours = @search.result

    @arrTours = @tours.to_a

    # STEP 4, filter out unavailable tours

  end
end

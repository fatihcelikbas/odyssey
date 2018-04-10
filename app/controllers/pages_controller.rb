class PagesController < ApplicationController
  
  #display three tours on the homepage
  def home
    @tours = Tour.where(active: true).limit(3)
  end
  
  #search function that finds nearby tours
  def search
    #save the search
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
      @location = Geocoder.coordinates(session[:loc_search])
    end

    #find nearby tours
    if session[:loc_search] && session[:loc_search] != ""
      @tours_address = Tour.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @tours_address = Tour.where(active: true).all
    end

    #store tours in our array
    @search = @tours_address.ransack(params[:q])
    @tours = @search.result

    @arrTours = @tours.to_a

  end
end

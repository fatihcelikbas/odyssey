class WishlistsController < ApplicationController
  def index
    @wishlist = current_traveler.wishlists
  end

  def add_to_wishlist
    if current_traveler.wishlists.find_by_tour_id(params[:tour_id])
      flash[:alert] = "Already on wishlist!"
    else
      wishlist = current_traveler.wishlists.build("tour_id" => params[:tour_id], "traveler_id" => current_traveler.id)
      current_traveler.save
      puts(wishlist)
      flash[:notice] = "Added to wishlist!"
    end
    redirect_back(fallback_location: request.referer)
  end

  #delete tours from the traveler's wishlist
  def delete_from_wishlist
    current_traveler.wishlists.where(tour_id: params[:tour_id], traveler_id: params[:traveler_id]).first.destroy
    flash[:success] = "Tour deleted"
    redirect_to wishlists_index_path
    #current_traveler.wishlists.find(@tour)
  end
end

require 'test_helper'

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @traveler = travelers(:one)
  end

  test "should get wishlist if signed in" do
    sign_in(@traveler)
    get wishlists_index_url(@traveler)
    assert_response :success
  end

end

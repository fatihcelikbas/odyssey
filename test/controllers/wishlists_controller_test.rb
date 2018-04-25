require 'test_helper'

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @traveler = travelers(:one)
  end
  test "should get index" do
    get wishlists_index_url
    assert_response :success
  end

end

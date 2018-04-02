require 'test_helper'

class TravelersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @traveler = travelers(:one)
  end
  
  test "each review should be equal to one" do
    assert_equal(1, @tourist_reviews.count)
    assert_equal(1, @guide_reviews.count)
  end
  
end
require 'test_helper'

class TravelersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @traveler = travelers(:one)
    @tourist_reviews = Review.where(type: "TouristReview", guide_id: @traveler.id)
    @guide_reviews = Review.where(type: "GuideReview", tourist_id: @traveler.id)
    sign_in (@traveler)
  end

  test "each review should be zero until reviewed" do
    assert_equal(0, @tourist_reviews.count)
    assert_equal(0, @guide_reviews.count)
  end

  test "should get your trips" do
    get your_trips_url(@traveler)
    assert_response :success
  end

  test "should get your conversations" do
    get conversations_url(@traveler)
    assert_response :success
  end
  
  test "should get your payment method" do
    get payment_method_url(@traveler)
    assert_response :success
  end
  
  test "should get your payout method" do
    get payout_method_url(@traveler)
    assert_response :success
  end
  
end

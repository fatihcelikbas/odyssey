require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @traveler = travelers(:one)
    @touristReview = reviews(:one)
    @guideReview = reviews(:two)
  end

  #Tests without traveler signed in
  # test "should not post tourist review if not signed in" do
  #   post tourist_reviews_url, params: {:tourist_review => @touristReview.attributes}
  #   assert_response :redirect
  # end

  # test "should not delete tourist review if not signed in" do
  #   delete tourist_review_url(@touristReview)
  #   assert_response :failure
  # end
  
  # test "should not post guide review if not signed in" do
  #   post guide_reviews_url(@guideReview), params: {:guide_review => @guideReview }
  #   assert_response :redirect
  # end

  # test "should not delete guide review if not signed in" do
  #   delete guide_review_url(@guideReview)
  #   assert_response :redirect
  # end

  # #Tests with traveler signed in
  # test "should post tourist review if not signed in" do
  #   post tourist_reviews_url(@touristReview), params: {:tourist_review => @touristReview }
  #   assert_response :success
  # end

  # test "should delete tourist review if not signed in" do
  #   delete tourist_review_url(@touristReview)
  #   assert_response :success
  # end
  
  # test "should post guide review if not signed in" do
  #   post guide_reviews_url(@guideReview), params: {:guide_review => @guideReview }
  #   assert_response :success
  # end

  # test "should delete guide review if not signed in" do
  #   delete guide_review_url(@guideReview)
  #   assert_response :success
  # end

end

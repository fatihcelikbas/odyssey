require 'test_helper'

class TourControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @traveler = travelers(:one)
    @tour = @traveler.tours.first
  end

  test "signed in user is redirected to root_path" do
    get traveler_session_path
    assert_equal 200, status
    post traveler_session_path 'traveler[email]' => @traveler.email, 'traveler[password]' => 'password'
    follow_redirect!
    assert_equal 200, status
    assert_equal "/", path
  end

  #Tests without traveler signed in
  test "should not get index if not signed in" do
    get tours_url
    assert_response :redirect
  end

  test "should not get new if not signed in" do
    get new_tour_url
    assert_response :redirect
  end

  #Tests with traveler signed in

  test "should get listing" do
    # :id = 1
    sign_in(@traveler)
    get listing_tour_url(@tour)
    assert_response :success
  end

  test "should get pricing" do
    sign_in(@traveler)
    get pricing_tour_url(@tour)
    assert_response :success
  end

  test "should get description" do
    sign_in(@traveler)
    get description_tour_url(@tour)
    assert_response :success
  end

  test "should get features" do
    sign_in(@traveler)
    get features_tour_url(@tour)
    assert_response :success
  end

  test "should get location" do
    sign_in(@traveler)
    get location_tour_url(@tour)
    assert_response :success
  end

end

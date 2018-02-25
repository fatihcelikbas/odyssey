require 'test_helper'

class TourControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tour_index_url
    assert_response :success
  end

  test "should get new" do
    get tour_new_url
    assert_response :success
  end

  test "should get create" do
    get tour_create_url
    assert_response :success
  end

  test "should get listing" do
    get tour_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get tour_pricing_url
    assert_response :success
  end

  test "should get description" do
    get tour_description_url
    assert_response :success
  end

  test "should get features" do
    get tour_features_url
    assert_response :success
  end

  test "should get location" do
    get tour_location_url
    assert_response :success
  end

  test "should get update" do
    get tour_update_url
    assert_response :success
  end

end

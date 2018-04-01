require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @traveler = travelers(:one)
    @reservation = reservations(:one)
  end

  #Tests without traveler signed in
  test "should not get your trips if not signed in" do
    get your_trips_url
    assert_response :redirect
  end

  test "should not get your reservations if not signed in" do
    get your_reservations_url
    assert_response :redirect
  end
  
  test "should redirect to your reservations path for approve" do
    post approve_reservation_url
    follow_redirect!
    assert_equal 200, status
    assert_equal your_reservations_path, path
  end
  
  test "should redirect to your reservations path for decline" do
    post decline_reservation_url
    follow_redirect!
    assert_equal 200, status
    assert_equal your_reservations_path, path
  end
  
  #Tests with traveler signed in
  test "should get your reservations" do
    sign_in(@traveler)
    get your_reservations_url
    assert_response :success
  end
  
  test "should get your trips" do
    sign_in(@traveler)
    get your_trips_url
    assert_response :success
  end
  
  # test "should create reservation" do
  #   assert_difference('Reservation.count') do
  #     post tour_reservations_url, params: { reservation: {  } }
  #   end
  #
  #   assert_redirected_to reservation_url(Reservation.last)
  # end

  # test "should show reservation" do
  #   get reservation_url(@reservation)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_reservation_url(@reservation)
  #   assert_response :success
  # end

  # test "should update reservation" do
  #   patch reservation_url(@reservation), params: { reservation: {  } }
  #   assert_redirected_to reservation_url(@reservation)
  # end

  # test "should destroy reservation" do
  #   assert_difference('Reservation.count', -1) do
  #     delete reservation_url(@reservation)
  #   end
  #
  #   assert_redirected_to reservations_url
  # end
end

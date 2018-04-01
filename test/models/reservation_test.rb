require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  def setup
    @reservation = reservations(:one)
  end
  
  test "reservation belongs to traveler" do
    assert_not_nil @reservation.traveler
  end
  test "reservation belongs to tour" do
    assert_not_nil @reservation.tour
  end

  test 'invalid without traveler' do
    @reservation.traveler = nil
    refute @reservation.valid?, 'reservation is valid without a traveler'
    assert_not_nil @reservation.errors[:traveler], 'no validation error for traveler present'
  end

  test 'invalid without tour' do
    @reservation.tour = nil
    refute @reservation.valid?, 'reservation is valid without a tour'
    assert_not_nil @reservation.errors[:tour], 'no validation error for tour present'
  end
end

require 'test_helper'

class TourTest < ActiveSupport::TestCase

  def setup
    @tour = tours(:one)
  end

  test "tour belongs to traveler" do
    assert_not_nil @tour.traveler
  end

  test 'invalid without traveler' do
    @tour.traveler = nil
    refute @tour.valid?, 'tour is valid without a traveler'
    assert_not_nil @tour.errors[:traveler], 'no validation error for traveler present'
  end

  test 'invalid without max_persons' do
    @tour.max_persons = nil
    refute @tour.valid?, 'tour is valid without a max_persons'
    assert_not_nil @tour.errors[:max_persons], 'no validation error for max_persons present'
  end

  test 'invalid without duration' do
    @tour.duration = nil
    refute @tour.valid?, 'tour is valid without a duration'
    assert_not_nil @tour.errors[:duration], 'no validation error for duration present'
  end

  test 'invalid without city' do
    @tour.city = nil
    refute @tour.valid?, 'tour is valid without a city'
    assert_not_nil @tour.errors[:city], 'no validation error for city present'
  end
end

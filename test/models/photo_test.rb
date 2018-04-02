require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

  def setup
    @photo = photos(:one)
  end

  test "photo belongs to tour" do
    assert_not_nil @photo.tour_id
  end

  test 'invalid without tour' do
    @photo.tour_id = nil
    refute @photo.valid?, 'photo is valid without a tour'
    assert_not_nil @photo.errors[:tour], 'no validation error for tour present'
  end
end

require 'test_helper'

class TravelerTest < ActiveSupport::TestCase
  
  def setup
    @traveler = Traveler.new(:one)
  end
  
  test 'invalid without firstname' do
    @traveler.firstname = nil
    refute @traveler.valid?, 'traveler is valid without a firstname'
    assert_not_nil @traveler.errors[:firstname], 'no validation error for firstname present'
  end

  test 'invalid without lastname' do
    @traveler.lastname = nil
    refute @traveler.valid?, 'traveler is valid without a lastname'
    assert_not_nil @traveler.errors[:lastname], 'no validation error for lastname present'
  end
  
  test '#tours' do
    assert_equal 2, @traveler.tours.size
  end
  
  
  
  
end

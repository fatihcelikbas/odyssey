require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @touristReview = reviews(:one)
    @guideReview = reviews(:two)
  end

  test "touristReview is not empty" do
    assert_not_nil @touristReview.comment
  end
  
  test "guideReview is not empty" do
    assert_not_nil @guideReview.comment
  end
  
  test 'touristReview invalid without reservation' do
    @touristReview.reservation_id = nil
    refute @touristReview.valid?, 'touristReview is valid without a reservation'
    assert_not_nil @touristReview.errors[:reservation_id] 
  end
  
  test 'guideReview invalid without reservation' do
    @guideReview.reservation_id = nil
    refute @guideReview.valid?, 'guideReview is valid without a reservation'
    assert_not_nil @guideReview.errors[:reservation_id] 
  end
  
  test 'touristReview invalid without guide' do
    @touristReview.guide_id = nil
    refute @touristReview.valid?, 'touristReview is valid without a guide'
    assert_not_nil @touristReview.errors[:guide_id] 
  end
  
  test 'guideReview invalid without tourist' do
    @guideReview.tourist_id = nil
    refute @guideReview.valid?, 'guideReview is valid without a tourist'
    assert_not_nil @guideReview.errors[:tourist_id] 
  end
  
  test 'touristReview invalid without tour' do
    @touristReview.tour_id = nil
    refute @touristReview.valid?, 'touristReview is valid without a tour'
    assert_not_nil @touristReview.errors[:tour_id] 
  end
  
  test 'guideReview invalid without tour' do
    @guideReview.tour_id = nil
    refute @guideReview.valid?, 'guideReview is valid without a tour'
    assert_not_nil @guideReview.errors[:tour_id]
  end

end

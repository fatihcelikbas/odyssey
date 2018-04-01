require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @photo = photos(:one)
    @tour = tours(:one)
  end
  
  test "should create photo" do
    assert_difference('Photo.count') do
      post tour_photos_url(@tour), params: { images: {  }, }
    end
  end
  
  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete tour_photo_url(@photo)
    end
  end
  
  
  
  
  
end
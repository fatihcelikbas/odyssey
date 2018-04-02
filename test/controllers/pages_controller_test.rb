require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get traveler session new" do
    get new_traveler_session_url
    assert_response :success
  end
end

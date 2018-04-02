class ConversationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @traveler = travelers(:one)
    @conversation = conversations(:one)
  end

  #Tests without traveler signed in
  test "should not get index if not signed in" do
    get conversations_url
    assert_response :redirect
  end

  test "should create conversation" do
    sign_in(@traveler)
    post conversations_url, params: { sender_id: 1, recipient_id: 2}
    assert_response :found
  end

  #Tests with traveler signed in
  test "should get index" do
    sign_in(@traveler)
    get conversations_url
    assert_response :success
  end

end

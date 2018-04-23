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

  test "should be correct sender" do
    assert_equal @conversation.sender_id, 1
  end

  test "should be correct recipient" do
    assert_equal @conversation.recipient_id, 2
  end

  #Tests with traveler signed in
  test "should create conversation" do
    sign_in(@traveler)
    post conversations_url, params: { sender_id: 1, recipient_id: 2}
    assert_response :found
  end

  test "should get index" do
    sign_in(@traveler)
    get conversations_url
    assert_response :success
  end

end

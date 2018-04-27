require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @messages = Conversation.where(sender_id: 1, recipient_id: 2)
    @traveler = travelers(:one)
  end


    #Tests without traveler signed in
    test "should not get conversation if not signed in" do
        get conversation_messages_url(@messages)
        assert_response :redirect
    end

    test "should get all conversations if signed in" do
        sign_in(@traveler)
        get conversations_url()
        assert_response :success
    end

end

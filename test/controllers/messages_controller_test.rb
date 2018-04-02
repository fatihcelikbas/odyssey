require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
    
    
    #Tests without traveler signed in
    test "should not get index if not signed in" do
        get conversation_messages_url
        assert_response :redirect
    end
    
    
end

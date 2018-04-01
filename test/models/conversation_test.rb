require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  def setup
    @conversation = conversations(:one)
  end

  test "two different people" do
    assert @conversation.recipient_id != @conversation.sender_id
  end
end

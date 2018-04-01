require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = messages(:one)
  end
  test "message belongs to traveler" do
    assert_not_nil @message.traveler
  end
  test "message belongs to conversation" do
    assert_not_nil @message.conversation
  end

  test 'invalid without traveler' do
    @message.traveler = nil
    refute @message.valid?, 'message is valid without a traveler'
    assert_not_nil @message.errors[:traveler], 'no validation error for traveler present'
  end

  test 'invalid without conversation' do
    @message.conversation = nil
    refute @message.valid?, 'message is valid without a conversation'
    assert_not_nil @message.errors[:conversation], 'no validation error for conversation present'
  end

end

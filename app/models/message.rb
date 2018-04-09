class Message < ApplicationRecord
  belongs_to :traveler
  belongs_to :conversation
  
  validates_presence_of :context, :conversation_id, :traveler_id
  
  #define the time a message is sent
  def message_time
    self.created_at.strftime("%v")
  end
end

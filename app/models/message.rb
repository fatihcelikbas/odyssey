class Message < ApplicationRecord
  belongs_to :traveler
  belongs_to :conversation
  
  validates_presence_of :context, :conversation_id, :traveler_id
  
  def message_time
    self.created_at.strftime("%v")
  end
end

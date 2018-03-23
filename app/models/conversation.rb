class Conversation < ApplicationRecord
    belongs_to :sender, foreign_key: :sender_id, class_name: "Traveler"
    belongs_to :recipient, foreign_key: :recipient_id, class_name: "Traveler"

    has_many :messages, dependent: :destroy
    validates_uniqueness_of :sender_id, :recipient_id

    scope :involving, -> (traveler) {
        where("conversations.sender_id = ? OR conversations.recipient_id = ?", traveler.id, traveler.id)
    }

    scope :between, -> (traveler_A, traveler_B) {
        where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)",
        traveler_A, traveler_B, traveler_B, traveler_A)
    }
end

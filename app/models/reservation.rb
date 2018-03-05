class Reservation < ApplicationRecord
  enum status: {Waiting: 0, Approved: 1, Declined: 2}
  belongs_to :traveler
  belongs_to :tour
end

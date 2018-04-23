class Wishlist < ApplicationRecord
  belongs_to :traveler
  has_many :tours
end

class Tour < ApplicationRecord
  belongs_to :traveler
  has_many :photos  
  
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  
  validates :max_persons, presence: true
  validates :duration, presence: true
  #validates :price, presence: true
  #validates :title, presence: true
  #validates :description, presence: true
  #validates :city, presence: true
end

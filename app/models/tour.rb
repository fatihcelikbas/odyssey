class Tour < ApplicationRecord
  belongs_to :traveler
  has_many :photos
  has_many :reservations
  has_many :tourist_reviews
  
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  
  validates :max_persons, presence: true
  validates :duration, presence: true
  #validates :price, presence: true
  #validates :title, presence: true
  #validates :description, presence: true
  #validates :city, presence: true
  
  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end
  
  def average_rating
    tourist_reviews.count == 0 ? 0 : tourist_reviews.average(:star).round(2).to_i
  end
end

class Tour < ApplicationRecord
  enum instant: {Request: 0, Insant: 1}
  belongs_to :traveler
  has_many :photos, dependent: :delete_all
  has_many :reservations, dependent: :delete_all
  has_many :tourist_reviews, dependent: :delete_all

  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  validates :max_persons, presence: true
  validates :duration, presence: true
  validates :city, presence: true
  #validates :price, presence: true
  #validates :title, presence: true
  #validates :description, presence: true

  #set the cover photo
  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

  #calculate the average rating
  def average_rating
    tourist_reviews.count == 0 ? 0 : tourist_reviews.average(:star).round(2).to_i
  end
end

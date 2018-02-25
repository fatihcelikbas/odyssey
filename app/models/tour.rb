class Tour < ApplicationRecord
  belongs_to :guide
  
  #validates :max_persons, presence: true
  #validates :duration, presence: true
  #validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
end
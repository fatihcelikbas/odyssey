class Photo < ApplicationRecord
  belongs_to :tour
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end

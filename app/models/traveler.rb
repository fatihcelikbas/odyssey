class Traveler < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
         
    validates :firstname, presence: true, length: {maximum: 50}
    validates :lastname, presence: true, length: {maximum: 50}
    
    def self.from_omniauth(auth)
      traveler = Traveler.where(email: auth.info.email).first
      if traveler
        return traveler
      else
        where(provider: auth.provider, uid: auth.uid).first_or_create do |traveler|
          traveler.email = auth.info.email
          traveler.password = Devise.friendly_token[0,20]
          traveler.firstname = auth.info.name.gsub(/\s+/, ' ').strip.split(" ")[0]
          traveler.lastname = auth.info.name.gsub(/\s+/, ' ').strip.split(" ")[-1]
          traveler.image = auth.info.image # assuming the traveler model has an image
          traveler.uid = auth.uid
          traveler.provider = auth.provider
          
          
          # If you are using confirmable and the provider(s) you use validate emails, 
          # uncomment the line below to skip the confirmation emails.
          traveler.skip_confirmation!
        end
      end
    end
    
end

module ApplicationHelper
    def avatar_url(traveler)
        gravatar_id = Digest::MD5::hexdigest(traveler.email).downcase
        "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end
end

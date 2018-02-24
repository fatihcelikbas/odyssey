module ApplicationHelper
    def avatar_url(traveler)
        
        if traveler.image
            "http://graph.facebook.com/#{traveler.uid}/picture?type=large"
        else
            gravatar_id = Digest::MD5::hexdigest(traveler.email).downcase
            "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
        end
    end
end

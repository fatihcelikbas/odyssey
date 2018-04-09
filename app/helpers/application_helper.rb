module ApplicationHelper
    def avatar_url(traveler)
        
        if traveler.image
            "http://graph.facebook.com/#{traveler.uid}/picture?type=large"
        else
            gravatar_id = Digest::MD5::hexdigest(traveler.email).downcase
            "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon&s=150"
        end
    end
    
    def stripe_express_path
        "https://connect.stripe.com/express/oauth/authorize?response_type=code&client_id=ca_Ce4HDJPR8lmSBIO32NejjK56UcAfbISW&scope=read_write"
    end
end

module ApplicationHelper

    #get the gravatar or facebook profile image
    def avatar_url(traveler)
        if traveler.image
            "https://graph.facebook.com/#{traveler.uid}/picture?type=large"
        else
            gravatar_id = Digest::MD5::hexdigest(traveler.email).downcase
            "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon&s=150"
        end
    end

    #define the path for signing up for payout through stripe
    def stripe_express_path
        "https://connect.stripe.com/express/oauth/authorize?response_type=code&client_id=ca_Ce4HDJPR8lmSBIO32NejjK56UcAfbISW&scope=read_write"
    end
end

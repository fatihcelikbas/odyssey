class TravelersController < ApplicationController
    before_action :authenticate_traveler!, except: [:show]
    
    #define the variables needed to display a Traveler's profile
    def show
        @traveler = Traveler.find(params[:id])
        @tours = @traveler.tours
        @tourist_reviews = Review.where(type: "TouristReview", guide_id: @traveler.id)
        @guide_reviews = Review.where(type: "GuideReview", tourist_id: @traveler.id)
    end
    
    def payment
    end
    
    #get the merchant account for a traveler
    def payout
        if !current_traveler.merchant_id.blank?
            account = Stripe::Account.retrieve(current_traveler.merchant_id)
            @login_link = account.login_links.create()
        end
    end

    #add a credit card to stripe
    def add_card
        if current_traveler.stripe_id.blank?
        customer = Stripe::Customer.create(
            email: current_traveler.email
        )
        current_traveler.stripe_id = customer.id
        current_traveler.save

        # Add Credit Card to Stripe
        customer.sources.create(source: params[:stripeToken])
        else
            customer = Stripe::Customer.retrieve(current_traveler.stripe_id)
            customer.source = params[:stripeToken]
            customer.save
        end

        flash[:notice] = "Your card is saved."
        redirect_to payment_method_path
        
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to payment_method_path
    end
end

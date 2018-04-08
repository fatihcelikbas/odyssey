class TravelersController < ApplicationController
    before_action :authenticate_traveler!, except: [:show]
    
    def show
        @traveler = Traveler.find(params[:id])
        @tours = @traveler.tours

        # Display all the tourist reviews to guide (if this traveler is a guide)
        @tourist_reviews = Review.where(type: "TouristReview", guide_id: @traveler.id)

        # Display all the guide reviews to tourist (if this traveler is a tourist)
        @guide_reviews = Review.where(type: "GuideReview", tourist_id: @traveler.id)

    end
    
    def payment
    end

    def payout
        if !current_traveler.merchant_id.blank?
        account = Stripe::Account.retrieve(current_traveler.merchant_id)
        @login_link = account.login_links.create()
        end
    end

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

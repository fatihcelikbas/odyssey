class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  #Facebook login through Omniauth
  def facebook
    # You need to implement the method below in your model (e.g. app/models/traveler.rb)
    @traveler = Traveler.from_omniauth(request.env["omniauth.auth"])

    if @traveler.persisted?
      sign_in_and_redirect @traveler, event: :authentication #this will throw if @traveler is not activated
      set_flash_traveler(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_traveler_registration_url
    end
  end
  
  #connect Stripe for payout
  def stripe_connect
    auth_data = request.env["omniauth.auth"]
    @traveler = current_traveler

    if @traveler.persisted?
      @traveler.merchant_id = auth_data.uid
      @traveler.save

      if !@traveler.merchant_id.blank?

        # Set Payout Schedule for every week
        account = Stripe::Account.retrieve(current_traveler.merchant_id)
        account.payout_schedule.delay_days = 7
        account.payout_schedule.interval = "daily"
        
        # Set Payout Schedule for the 15th of every month
        # account.payout_schedule.monthly_anchor = 15
        # account.payout_schedule.interval = "monthly"

        account.save
      end
      
      sign_in_and_redirect @traveler, event: :authentication
      flash[:notice] = "Stripe Account Created" if is_navigational_format?
    else
      session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

end

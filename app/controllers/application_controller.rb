class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    #define variables needed for traveler profile when signing up and when updating profile
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :phone_number, :description, :gender, :occupation, :education, :hometown, :languages => []])
    end

end

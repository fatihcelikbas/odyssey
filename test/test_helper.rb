ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :conversations, :messages, :photos, :reservations, :tours, :travelers
  def sign_in(traveler)
    post traveler_session_path \
      'traveler[email]'    => traveler.email,
      'traveler[password]' => traveler.password
  end

  class ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end

Rails.configuration.stripe = {
  :publishable_key => 'pk_test_WIPqFxmwtnPpvRrQ7WOAn5S6',
  :secret_key => 'sk_test_DZZkZd0WLh6IzyOqM3VQGbYu'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]

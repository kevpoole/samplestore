# Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

if Rails.env.production?
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  else
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
  end
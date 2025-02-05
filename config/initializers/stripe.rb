# Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

if Rails.env.production?
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    Stripe.publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']
  else
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
    Stripe.publishable_key = Rails.application.credentials.dig(:stripe, :publishable_key)
  end
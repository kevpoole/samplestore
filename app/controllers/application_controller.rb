class ApplicationController < ActionController::Base
  before_action :set_current_cart
  before_action :set_background_image


  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def set_current_cart
    session_expiration_period = 6.hours

  # Find all carts where the session has expired (last accessed > 24 hours ago)
    if session[:current_cart_id].present?
      Cart.where("updated_at < ?", session_expiration_period.ago).destroy_all
    end


    @current_cart = Cart.find_by(secret_id: session[:current_cart_id])

    unless @current_cart
      @current_cart = Cart.create
      session[:current_cart_id] = @current_cart.secret_id
    end
  end

  def set_background_image
    @background_image = BackgroundImage.first
  end

  
end

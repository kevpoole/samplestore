class CheckoutsController < ApplicationController
    def create
        secret_id = params[:secret_id] # Extract secret_id
        return render json: { error: "Missing secret_id" }, status: :unprocessable_entity if secret_id.blank?
        @cart = Cart.find_by(secret_id: secret_id)
        return render json: { error: "Cart not found" }, status: :not_found unless @cart
        Rails.logger.debug "Params: #{params.inspect}"
        cart_items = @cart.cart_items.includes(:product)
        line_items = cart_items.map do |item|
        {
          price_data: {
            currency: 'usd',
            product_data: { name: item.product.name,
            description: "#{item.options}",
            },
            unit_amount: (item.product.price * 100).to_i,
          },
          quantity: 1
        }
      end
  
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: line_items,
        mode: 'payment',
        success_url: checkout_success_url,
        cancel_url: checkout_cancel_url
      )
  
      redirect_to session.url, allow_other_host: true
    end
  
    def success
      redirect_to root_path, notice: "Payment successful!"
    end
  
    def cancel
      redirect_to cart_path(@current_cart.secret_id), alert: "Payment was cancelled."
    end

    def show
        @cart = Cart.find_by(secret_id: params[:secret_id])
        
        if @cart.nil?
          Rails.logger.debug "Cart not found for secret_id: #{params[:secret_id]}"
          redirect_to categories_path, alert: "Cart not found."
          return
        end
      end
  end
  

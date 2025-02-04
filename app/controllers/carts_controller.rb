class CartsController < ApplicationController
    def create 
        @product = Product.find(params[:product_id])
        selected_option = params[:selected_option]

        @current_cart.cart_items.find_or_create_by(product: @product) do |item|
          item.update(options: selected_option) if selected_option.present?

          respond_to do |format|
            redirect_to cart_path(@current_cart.secret_id)
            format.turbo_stream
          end

        end

    
        # respond_to do |format|
        #   format.turbo_stream 
        #   format.html { redirect_to products_path, notice: "#{product.name} added to cart" }
        # end
    end 

    def show
        @cart = Cart.find_by(secret_id: params[:secret_id])
        if @cart
          @cart_id = @cart.id
          @cart_items = @cart.cart_items.includes(:product)
        else
          render plain: "Cart not found", status: :not_found
        end
        
      end
end
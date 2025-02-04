class CartItemsController < ApplicationController
    def destroy
      @cart_item = CartItem.find(params[:id])
      
      @cart_item.destroy
      @cart = @cart_item.cart 
  
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back fallback_location: product_path(@cart_item.product), notice: "Item removed from cart." }
      end
    end
  end
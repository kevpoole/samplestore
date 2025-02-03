class ProductsController < ApplicationController 
   
    def show 
        @product = Product.find(params[:id])  # Corrected variable name
        unless @product.active?
            redirect_to categories_path, alert: "Product not available."
        end
    end
end
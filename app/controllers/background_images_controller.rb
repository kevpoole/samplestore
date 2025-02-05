class BackgroundImagesController < ApplicationController
    def show
      @background_image = BackgroundImage.first
    end
  
    def update
      @background_image = BackgroundImage.first_or_initialize
  
      if @background_image.update(image_params)
        redirect_to background_image_path, notice: "Background image updated successfully."
      else
        render :show, status: :unprocessable_entity
      end
    end
  
    private
  
    def image_params
      params.require(:background_image).permit(:image)
    end
  end
  
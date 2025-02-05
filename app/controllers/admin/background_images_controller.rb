class Admin::BackgroundImagesController < AdminController
    before_action :set_admin_background_image

    def new
        @admin_background_image = BackgroundImage.new
    end

    def index
      @admin_background_image = BackgroundImage.first
    end

    def show 
      @admin_background_image = BackgroundImage.first
    end

    def create
      @admin_background_image = BackgroundImage.first_or_initialize
      @admin_background_image.image = admin_background_image_params[:image]
      if @admin_background_image.save
        redirect_to admin_background_images_path, notice: "Background image added successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
  
    def edit
      @background_image = BackgroundImage.first
    
      unless @background_image
        redirect_to new_admin_background_image_path, alert: "No background image found. Please add one."
      end
    end
  
    def update
      @admin_background_image = BackgroundImage.first

      if @admin_background_image.update(admin_background_image_params)
        redirect_to admin_background_images_path, notice: "Background image updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_admin_background_image
      @admin_background_image = BackgroundImage.first
    end
  
    def admin_background_image_params
      params.require(:background_image).permit(:image)
    end
  end
  
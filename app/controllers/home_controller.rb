class HomeController < ApplicationController 
    def index 
        @background_image = BackgroundImage.first
    end
end
class FavoritesController < ApplicationController
    def create 
        @favorite = Favorite.new(favorite_params)
        if @favorite.save 
            redirect_to image_path(params["favorite"]["image_id"])  
        end
    end



    private 
    def favorite_params 
        params.require(:favorite).permit(:user_id, :image_id)
    end
end

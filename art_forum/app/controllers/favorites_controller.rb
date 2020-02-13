class FavoritesController < ApplicationController
    def create 
        @favorite = Favorite.new(favorite_params)
        if @favorite.save 
            redirect_to image_path(params["favorite"]["image_id"])  
        end
    end

    def destroy 
        @favorite = Favorite.find(params[:id])
        # redirect_to user_path(@favorite.user_id)
        redirect_to image_path(@favorite.image_id)
        @favorite.delete
    end

    private 
    def favorite_params 
        params.require(:favorite).permit(:user_id, :image_id)
    end
end

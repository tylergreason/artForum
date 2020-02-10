class ImagesController < ApplicationController
    def index
        # @images = Image.all
        @images = Image.sort_by_creation_date
    end

    def show
        @image = Image.find(params[:id])
        @comment = Comment.new
    end

    private 
    def image_params
        params.require(:image).permit(:url, :metro_link, :artist, :date_created, :title, :user_ids, :comments)
    end
end

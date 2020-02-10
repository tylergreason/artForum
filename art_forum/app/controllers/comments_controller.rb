class CommentsController < ApplicationController

    def create 
        @comment = Comment.new(comment_params)
        if @comment.valid? 
            # byebug
            @comment.save 
            redirect_to image_path(params["comment"]["image_id"])
        else 
            # byebug    
            flash[:notice] = @comment.error_message
            redirect_to image_path(params["comment"]["image_id"])
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        redirect_to image_path(@comment.image_id)
        @comment.delete 
    end

    def edit
        @comment = Comment.find(params[:id])
    end
    
    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        if @comment.valid?
            redirect_to image_path(@comment.image_id)
        else
            flash[:notice] = @comment.error_message
            render :edit
        end
    end

    private 
    def comment_params 
        params.require(:comment).permit(:user_id, :image_id, :text)
    end

end

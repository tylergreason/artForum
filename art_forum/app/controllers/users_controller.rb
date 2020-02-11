class UsersController < ApplicationController
    def index 
        # before_action :authenticate_user! 
        @users = User.all
    end

    def show 
        # byebug
        if User.find_by(params[:id]) == nil 
            redirect_to :index
        else
            @user = User.find(params[:id])
        end
    end

    # private 
    # no longer using parameters here; see app/controllers/users/sessions_controller for new param
    # params.require(:user).permit(:first_name, :last_name, :email, :location, :biography)
end

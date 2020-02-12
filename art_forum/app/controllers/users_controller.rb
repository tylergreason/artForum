class UsersController < ApplicationController
    def index 
        @users = User.all
    end

    def show 
        @user = User.find(params[:id])
    end

    def update 

    end
    # private 
    # no longer using parameters here; see app/controllers/users/sessions_controller for new param
    # params.require(:user).permit(:first_name, :last_name, :email, :location, :biography)
end

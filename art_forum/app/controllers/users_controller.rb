class UsersController < ApplicationController
    def index 
        # before_action :authenticate_user! 
        @users = User.all
    end

    def show 
        # byebug
        @user = User.find(params[:id])
    end

    private 
    params.require(:user).permit(:first_name, :last_name, :email, :location, :biography)
end

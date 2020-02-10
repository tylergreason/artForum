class UsersController < ApplicationController
    def index 
        @users = User.all
    end

    def show 
        @user = User.find(params[:id])
    end

    private 
    params.require(:user).permit(:first_name, :last_name, :email, :location, :biography)
end

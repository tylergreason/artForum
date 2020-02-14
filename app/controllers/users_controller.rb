class UsersController < ApplicationController
    def index 
        @users = User.all
    end

    def show 
        @user = User.find(params[:id])
    end

    def update 

    end

    # user params are kept in application_controller > configure_permitted_params
end

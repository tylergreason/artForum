# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  #   
  # end

  # # POST /resource
  # def create
  #   super
  #   byebug
  # end

  # # GET /resource/edit
  # def edit
  #   redirect_to current_user
  #   # super
  # end

  # # PUT /resource
  # def update
  #   super
  #   @user.update
  # end

  # DELETE /resource
  # def destroy
  #   byebug
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  #   byebug
  # end

    # def sign_up_params
    #   params(:user).permit(:sign_up, permit(:first_name, :last_name, :email, :password, :password_confirmation, :biography, :location))
    # end
  # If you have extra params to permit, append them to the sanitizer.
  # def account_update_params
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :biography, :location])
  # end

  # def edit_user_params
      # params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :biography, :location)
  # end

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end
  # @user.update_without_password(:first_name, :last_name,:biography, :location)

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end 
end

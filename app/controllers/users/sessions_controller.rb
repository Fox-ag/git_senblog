# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # 初回ログイン時にユーザー情報編集ページへ移動
  # def after_sign_in_path_for(resource)
  #   if resource.sign_in_count ==1
  #     edit_user_path(current_user)
  #   else
  #     root_path
  #   end
  # end
  
  # ログイン時にユーザー情報が編集されていなければユーザー情報編集ページへ移動
  def after_sign_in_path_for(resource)
    if resource.family_name.nil?
      edit_user_path(current_user)
    else
      root_path
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

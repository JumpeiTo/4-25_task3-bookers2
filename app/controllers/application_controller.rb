# アプリケーションコントローラー

class ApplicationController < ActionController::Base
  
# ログインしていない時のアクセス制限
  before_action :authenticate_user!, except: [:top, :about]
# nameをデータとして保存できるよう許可
  before_action :configure_permitted_parameters, if: :devise_controller?
  
# サインイン後にどこに遷移するか
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
# サインアウト後にどこに遷移するか
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end

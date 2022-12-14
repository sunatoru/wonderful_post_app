class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    articles_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end

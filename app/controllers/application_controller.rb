class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  # def after_sign_in_path_for(resource)
  #   articles_path
  # end
end

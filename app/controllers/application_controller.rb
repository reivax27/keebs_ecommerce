class ApplicationController < ActionController::Base
  # if you want to log in before accessing the site
  # before_action :authenticate_user!

  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :name, :address, :phone, :province_id)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :name, :address, :phone, :province_id)}
  end
end

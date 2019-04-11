# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # if you want to log in before accessing the site
  # before_action :authenticate_customer!

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  before_action :load_cart

  private

  def initialize_session
    # session[:shopping_cart] ||= []
    session[:shopping_cart] ||= []
    # session[:subtotal] ||= 0
  end

  def load_cart
    # id = params[:id].to_i
    # @shopping_cart = Product.find(session[:shopping_cart])
    @shopping_cart = []
    session[:subtotal] = 0
    session[:shopping_cart].each do |cart_item|
      @shopping_cart << Product.find(cart_item['id'])
      current_price = Product.find(cart_item['id']).price * cart_item['quantity']
      session[:subtotal] += current_price
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :name, :address, :phone, :province_id) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :name, :address, :phone, :province_id) }
  end
end

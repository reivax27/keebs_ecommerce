class ApplicationController < ActionController::Base
  # if you want to log in before accessing the site
  # before_action :authenticate_user!

  protect_from_forgery
  
end

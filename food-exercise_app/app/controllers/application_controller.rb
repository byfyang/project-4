class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def require_login
  	if !current_user
  		flash[:error] = "Please login or create an account! Don't be lazy"
  		redirect_to '/'
  	end
  end

  def current_profile?
  	if current_user.id != params[:id]
  		flash[:error] = "You are not authorized to view this!"
  		redirect_to "/users/#{current_user.id}"
  	end
  end

end

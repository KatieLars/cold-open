class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #see if it's authenticate before login is necessary

  def logged_in?
    !!current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  helper_method :current_user, :logged_in?
end

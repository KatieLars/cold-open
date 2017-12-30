class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  #see if it's authenticate before login is necessary
  def authentication_required
    if !logged_in?
      redirect_to root_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user, :logged_in?
end

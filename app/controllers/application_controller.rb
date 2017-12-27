class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #see if it's authenticate before login is necessary
  
  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.create_by(id: params[:user_id])
  end

  helper_method :current_user, :logged_in?
end

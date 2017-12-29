class SessionsController < ApplicationController

  def new
    #displays login form if not already logged in
  end

  def create #creates a new user session
    if auth_hash = request.env["omniauth.auth"]
      user = User.from_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to user_home_path(user)
    else
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_home_path(user)
      else
        render 'sessions/new'
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
    #Signs a user out
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

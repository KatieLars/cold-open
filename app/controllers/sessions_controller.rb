class SessionsController < ApplicationController

  def new

  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.from_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to user_home_path(user)
    else
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
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
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

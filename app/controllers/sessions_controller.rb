class SessionsController < ApplicationController

  def new
    #displays login form if not already logged in
  end

  def create
    #request.env['omniauth.auth']
    #if auth_hash = request.env["omniauth.auth"]
  end

  def destroy
    #Signs a user out
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

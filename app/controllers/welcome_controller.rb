class WelcomeController < ApplicationController

  def home
    if logged_in?
      redirect_to user_home_path(current_user)
    end
  end

  def about
  end

end

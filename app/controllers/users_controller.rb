class UsersController < ApplicationController
  #creates a new user and logs them in

  #following actions happen when logged in
    #goes to user home page
    #updates user

  def home #distinct from show path, which is the user's account
    #displays:
      #food that expires this week
      #links to freezers
  end

  def show
    #shows logged in user information and option to edit
  end

  def create
    #creates user and logs them in
  end

  def edit
    #displays edit form
  end

  def update
    #updates user information
  end

end

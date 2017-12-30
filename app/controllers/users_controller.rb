class UsersController < ApplicationController
  #creates a new user and logs them in
  def home #distinct from show path, which is the user's account
    @user = User.find_by(id: params[:id])
    @expired = @user.items.expired #list of expired items
    @expiration_week = @user.items.expiration_this_week
    @item = Item.new
  end

  def show
    @user = current_user
    #shows logged in user information and option to edit
  end

  def new #displays new user sign up
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

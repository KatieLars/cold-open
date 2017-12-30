class UsersController < ApplicationController
  before_action :authentication_required

  def home #done
    @user = User.find_by(id: params[:id])
    @expired = @user.items.expired #list of expired items
    @expiration_week = @user.items.expiration_this_week
    @item = Item.new
  end

  def show #done
  end

  def new #displays new user sign up
  end

  def create
    #creates user and logs them in
  end

  def edit
    @user = User.find_by(id: params[:id])
    #ADD ADMIN CHECKBOX
  end

  def update
    raise params.inspect
    @user = User.find_by(id: params[:id])
    

    #updates user information
  end

end

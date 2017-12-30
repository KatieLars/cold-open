class UsersController < ApplicationController
  before_action :authentication_required
  skip_before_action :authentication_required, only: [:new, :create]

  def home #done
    @user = User.find_by(id: params[:id])
    @expired = @user.items.expired #list of expired items
    @expiration_week = @user.items.expiration_this_week
    @item = Item.new
  end

  def show #done
  end

  def new #displays new user sign up
    @user = User.new
  end

  def create
    @user = User.new(user_params)


    #creates user and logs them in
  end

  def edit #current_user instead of @user

  end

  def update
    


    #updates user information
  end

  private


    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :image, :admin)
    end
end

class UsersController < ApplicationController
  before_action :authentication_required
  skip_before_action :authentication_required, only: [:new, :create]

  def home #done
    @expired = current_user.items.expired #list of expired items
    @expiration_week = current_user.items.expiration_this_week
    @item = Item.new
  end

  def show #done
  end

  def new #done
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_home_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit #done
  end

  def update #done
    current_user.update(user_params)
    redirect_to user_home_path(current_user)
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :image, :admin)
    end
end

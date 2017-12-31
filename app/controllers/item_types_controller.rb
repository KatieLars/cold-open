class ItemTypesController < ApplicationController
  before_action :find_item_type, only: [:edit, :update, :destroy]
  #must be a user admin in order to change the item types

  def index
    @item_types = ItemType.all
    authorize @item_types
  end

  def edit #page should have a drop down to select one item to edit
    authorize @set_type
  end

  def update
    authorize @set_type
    @set_type.update(type_params)
    redirect_to user_home_path(current_user)
  end

  def new #creates new type
    @item_type = ItemType.new
    authorize @item_type
  end

  def create
    @item_type = ItemType.new
    authorize @item_type
  end

  def destroy
    authorize @set_type
  end

  private

    def find_item_type
      @set_type = ItemType.find_by(id: params[:id])
    end

end

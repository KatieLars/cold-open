class ItemTypeController < ApplicationController
  #must be a user admin in order to change the item types

  def index #lists item_types --not nested, and no show page necessary
    @item_types = ItemType.all
    authorize @item_types
    #clicking on a link goes to the item edit page if user logged in
  end

  def edit #page should have a drop down to select one item to edit
    @item_type = ItemType.find_by(id: params[:id])
    authorize @item_type
  end

  def update
    @item_type = ItemType.find_by(id: params[:id])
    authorize @item_type
    #processes the edit form
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
    @item_type = ItemType.find_by(id: params[:id])
    authorize @item_type
  end

end

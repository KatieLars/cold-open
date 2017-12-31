class ItemTypesController < ApplicationController
  before_action :find_item_type, only: [:edit, :update, :destroy, :show]

  def index
    @item_types = ItemType.all
    authorize @item_types
  end

  def show
    authorize @set_type
  end

  def edit
    authorize @set_type
  end

  def update
    authorize @set_type
    @set_type.update(type_params)
    redirect_to item_type_path(@set_type)
  end

  def new
    @item_type = ItemType.new
    authorize @item_type
  end

  def create
    @item_type = ItemType.new(type_params)
    authorize @item_type
    if @item_type.save
      redirect_to item_type_path(@item_type)
    else
      @errors = @item_type.errors.full_messages
      render 'new'
    end
  end

  def destroy
    authorize @set_type
    ItemType.destroy(@set_type.id)
    redirect_to item_types_path
  end

  private

    def type_params
      params.require(:item_type).permit(:title, :storage_min, :storage_max)
    end

    def find_item_type
      @set_type = ItemType.find_by(id: params[:id])
    end

end

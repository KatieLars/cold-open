class ItemsController < ApplicationController
  before_action :authentication_required

  def index
    @items = current_user.items.alphabetize
    # binding.pry
    respond_to do |format|
     format.html { render :index }
     format.json { render json: @items}
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    @item.date_stored = Chronic.parse(params[:item][:date_stored]).to_datetime
    @item.users << current_user
    if @item.save
      redirect_to user_item_path(current_user, @item)
    else
      @errors = @item.errors.full_messages
      render 'new'
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
    respond_to do |format|
     format.html { render :show }
     format.json { render json: @item}
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.assign_attributes(item_params)
    @item.date_stored = Chronic.parse(params[:item][:date_stored]).to_datetime
    if @item.save
      redirect_to user_item_path(current_user, @item)
    else
      @errors = @item.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    item = Item.find_by(id: params[:id])
    item.destroy
    redirect_to user_items_path(current_user)
  end


  def expiring_this_month
    @items = current_user.items.expiration_one_month
  end


  def items_by_type
    @item_types = current_user.item_types
  end

  private

    def item_params
      params.require(:item).permit(:title, :date_stored, :freezer_id, :item_type_id,
        freezer_attributes: [:freezer_type, :name, :user_ids => []], notes_attributes: [:content, :user_id])
    end

end

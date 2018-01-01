class ItemsController < ApplicationController
  before_action :authentication_required
#must authenticate user first
#NESTED ROUTES
  def index #users/1/items
    @items = current_user.items.alphabetize
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
  end

  def edit #users/1/items/1/edit
    #edits item form
  end

  def update
    #updates items
  end

  def destroy
    #deletes an item
    #redirects to freezer path belonging to th item just destroyed
  end


  def expiring_this_month #nested
  end


  def items_by_type
  end

  private

    def item_params
      params.require(:item).permit(:title, :date_stored, :freezer_id, :item_type_id,
        freezer_attributes: [:freezer_type, :name, user_ids: []], notes_attributes: [:content])
    end

end

class ItemsController < ApplicationController
#must authenticate user first
#NESTED ROUTES
  def index #users/1/items
    #lists all the items in a user's freezer
  end

  def new
    @item = Item.new
  end

  def create
    #creates new item
    #redirects to item show page
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
      params.require(:items).permit(:title, :date_stored, :freezer_id, :item_type_id,
        freezer_attributes: [:freezer_type, :name, :user_ids], notes_attributes: [:content])
    end

end

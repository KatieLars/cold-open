class ItemTypeController < ApplicationController
  #must be a user admin in order to change the item types

  def index #lists item_types --not nested, and no show page necessary
    #clicking on a link goes to the item edit page if user logged in
  end

  def edit #page should have a drop down to select one item to edit

  end

  def update
    #processes the edit form
  end

  def new #creates new type
  end

  def create
  end

  def destroy
  end

end

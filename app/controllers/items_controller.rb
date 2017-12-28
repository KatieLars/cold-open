class ItemsController < ApplicationController
#must authenticate user first
#NESTED ROUTES
  def index #users/1/items
    #lists all the items in a user's freezer
  end

  def new #users/1/items/new
    #displays for for new item
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

  def expiring_this_week #users/1/items/expiring_this_week
    #displays a list of foods expiring in the next week
    #has options to show food expiring according to custom selected dates
    #Pre-selected options: 1 month, 2 months, 3 months, 4 months, 6 months, 1 year
  end

  def expiring_this_month #nested
  end

  def expired #nested
    
  end


end

class FreezersController < ApplicationController
#NESED ROUTE
  def index #users/1/freezers
    #displays all the freezers a user has
  end

  def new #users/1/freezers/new
    #shows form for new freezer
  end

  def create
    #creates new freezer
    #NESTED FORM TO ADD ITEMS TO FREEZER
    #redirects to freezer show page
  end

  def show #users/1/freezers/1
    #shows freezer and list of item sinside
  end

  def edit #users/1/freezers/1/edit
    #shows edit form for editing freezer
    #NOT FOR EDITING ITEMS
  end

  def update
    #updates freezer info
    #redirects to freezer show page
  end

  def destroy
    #destroys freezer
    #redirects to User home page
  end

  def top_10_expiration #users/1/freezers/expirations
    #displays top 10 items expiring with the ones expiring sooner first 
  end
end

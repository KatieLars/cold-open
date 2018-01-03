class FreezersController < ApplicationController
  before_action :authentication_required

  def index #users/1/freezers
    @freezers =  @current_user.freezers
  end

  def new #users/1/freezers/new
    @freezer = Freezer.new
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

end

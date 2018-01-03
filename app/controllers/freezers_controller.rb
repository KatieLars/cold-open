class FreezersController < ApplicationController
  before_action :authentication_required

  def index #users/1/freezers
    @freezers =  @current_user.freezers
  end

  def new #users/1/freezers/new
    @freezer = Freezer.new
  end

  def create
    @freezer = Freezer.new(freezer_params)
    #@item.date_stored = Chronic.parse(params[:item][:date_stored]).to_datetime
  #  @freezer.users << current_user
    if @freezer.save
      binding.pry
      redirect_to user_freezer_path(current_user, @freezer)
    else
      binding.pry
      @errors = @freezer.errors.full_messages
      render 'new'
    end
    #creates new freezer
    #NESTED FORM TO ADD ITEMS TO FREEZER
    #redirects to freezer show page
  end

  def show #users/1/freezers/1
    @freezer = Freezer.find_by(id: params[:id])
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

private

def freezer_params
  params.require(:freezer).permit(:name, :freezer_type, :item_ids => [])
end

end

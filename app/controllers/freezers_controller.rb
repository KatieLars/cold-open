class FreezersController < ApplicationController
  before_action :authentication_required

  def index #users/1/freezers
    @freezers =  @current_user.freezers
  end

  def new #users/1/freezers/new
    @freezer = Freezer.new
  end

  def create
    binding.pry
    @freezer = Freezer.new(freezer_params)
    binding.pry
    @item.date_stored = Chronic.parse(params[:item][:date_stored]).to_datetime
    @item.users << current_user
    if @item.save
      redirect_to user_item_path(current_user, @item)
    else
      @errors = @item.errors.full_messages
      render 'new'
    end
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

private

def freezer_params
  params.require(:freezer).permit(:name, :freezer_type, :user_id, :item_ids => [])
end

end

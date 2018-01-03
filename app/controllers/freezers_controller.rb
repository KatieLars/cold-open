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
    if @freezer.save
      redirect_to user_freezer_path(current_user, @freezer)
    else
      @errors = @freezer.errors.full_messages
      render 'new'
    end
  end

  def show
    @freezer = Freezer.find_by(id: params[:id])
  end

  def edit
    @freezer = Freezer.find_by(id: params[:id])
  end

  def update
    #updates freezer info
    #redirects to freezer show page
  end

  def destroy
    freezer = Freezer.find_by(id: params[:id])
    freezer.destroy
    redirect_to user_freezers_path(current_user)
  end

private

def freezer_params
  params.require(:freezer).permit(:name, :freezer_type, items_attributes: [:title, :date_stored, :item_type_id, :user_ids => [], :note =>[:content, :user_id]], :item_ids => [])
end

end

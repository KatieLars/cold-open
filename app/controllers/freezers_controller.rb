class FreezersController < ApplicationController
  before_action :authentication_required

  def index
    @freezers =  @current_user.freezers
  end

  def new
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
    respond_to do |format|
     format.html { render :show }
     format.json { render json: @freezer}
    end
  end

  def edit
    @freezer = Freezer.find_by(id: params[:id])
  end

  def update
    @freezer = Freezer.find_by(id: params[:id])
    @freezer.assign_attributes(freezer_params)
    if @freezer.save
      redirect_to user_freezer_path(current_user, @freezer)
    else
      @errors = @freezer.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    freezer = Freezer.find_by(id: params[:id])
    freezer.destroy
    redirect_to user_freezers_path(current_user)
  end

private

def freezer_params
  params.require(:freezer).permit(:name, :freezer_type, :user_ids => [], items_attributes: [:title, :date_stored, :item_type_id, :user_ids => [], :note =>[:content, :user_id]], :item_ids => [])
end

end

class NotesController < ApplicationController

  def new
    item = Item.find_by_id(params[:id])
    @note = item.notes.build
    render json: @note
  end

  def create

  end

  def update

  end

end

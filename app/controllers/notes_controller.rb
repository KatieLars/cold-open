class NotesController < ApplicationController

  def new
    item = Item.find_by_id(params[:id])
    @note = item.notes.build
    render json: @note
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note
    else
      render html: "items/#{params[:item_id]}/show"
    end
  end

  def update

  end

  private

  def note_params
    params.permit(:item_id, :content, :user_id, :created_at, :updated_at)
  end

end

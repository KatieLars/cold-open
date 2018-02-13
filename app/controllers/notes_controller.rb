class NotesController < ApplicationController

  def new
    item = Item.find_by_id(params[:id])
    @note = item.notes.build
    render json: @note
  end

  def create
    @note = Note.new(note_params)
    if @note.save #be sure that this is being saved to item as well
      render json: @note
    else
      render html: "items/#{params[:item_id]}/show"
    end
  end

  def update

  end

  private

  def note_params
    params.require(:note).permit(:item_id, :content)
  end

end

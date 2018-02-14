class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note
    else
      render html: "items/#{params[:item_id]}/show"
    end
  end

  def edit
    @note = Note.find_by_id(params[:id])

    render json: @note
  end

  def update
    @note = Note.find_by_id(params[:id])
    if @note.update
      render json: @note
    else
      render html: "items/#{@note.item.id}/show"
    end
  end

  private

  def note_params
    params.permit(:item_id, :content, :user_id, :created_at, :updated_at)
  end

end

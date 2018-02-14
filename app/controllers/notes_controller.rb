class NotesController < ApplicationController

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

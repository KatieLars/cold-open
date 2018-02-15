class NoteSerializer < ActiveModel::Serializer
  attributes :id, :updated_at, :content, :created_at, :create_or_updated_at
  belongs_to :item
  belongs_to :user

  def format_date(date) #put this in concerns
    if date
     date.strftime("%B %d, %Y")
    end
  end

  def create_or_updated_at
    if object.updated_at
      "<em>Last Updated at: #{format_date(object.updated_at)}</em>"
    else
      "<em>Created at: #{format_date(object.created_at)}</em>"
    end
  end

end

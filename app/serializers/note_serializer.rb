class NoteSerializer < ActiveModel::Serializer
  attributes :id, :updated_at, :content, :created_at
  belongs_to :item

  def format_date(date) #put this in concerns
    if date
     date.strftime("%B %d, %Y")
    end
  end

  def create_or_updated_at#not working
    if object.updated_at
      "<p><strong>Created at: </strong>#{format_date(object.created_at)}</p>
        <p><strong>Last Updated at: </strong>#{format_date(object.updated_at)}</p>"
    else
      "<p><strong>Created at: </strong>#{format_date(object.created_at)}</p>"
    end
  end

end

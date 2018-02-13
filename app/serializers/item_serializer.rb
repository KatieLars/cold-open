class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :expiration_max, :expiration_min, :date_stored, :expiration_zone
  has_many :notes
  
  def expiration_zone
    if object.expiration_min
      "#{format_date(object.expiration_min)} - #{format_date(object.expiration_max)}"
    else
      "#{format_date(object.expiration_max)}"
    end
  end

  def format_date(date)
    if date
     date.strftime("%B %d, %Y")
    end
  end

end

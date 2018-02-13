class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :expiration_max, :expiration_min, :date_stored, :expiration_zone

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

# def format_date(date)
#   if date
#     date.strftime("%B %d, %Y")
#   end
# end
#
# def expiration_zone(expiration_min=0, expiration_max)
#   if expiration_min
#     "#{format_date(expiration_min)} - #{format_date(expiration_max)}"
#   else
#     "#{format_date(expiration_max)}"
#   end
# end

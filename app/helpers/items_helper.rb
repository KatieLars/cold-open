module ItemsHelper
  def format_date(date)
    date.strftime("%B %d, %Y")
  end

  def expiration_zone(expiration_min=0, expiration_max)
    if expiration_min
      "#{format_date(expiration_min)} - #{format_date(expiration_max)}"
    else
      "#{format_date(expiration_max)}"
    end
  end

  def item_link_format(item)
    "#{item.title}: #{expiration_zone(item.expiration_min, item.expiration_max)}"
  end

end

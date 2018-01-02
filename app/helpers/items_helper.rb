module ItemsHelper
  def format_date(date)
    if date
      date.strftime("%B %d, %Y")
    end
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

  def notes_display(notes)
    if notes.any?
      notes.each {|note| puts "#{note.content}"}
    else
      "No Notes"
    end
  end

end

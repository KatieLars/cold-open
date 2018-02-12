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
        render partial: 'note', collection: @item.notes
    else
      "No Notes"
    end
  end

  def expiring_items_display(items)
    if items.any?
      render partial: 'items', collection: @items
    else
      "No items expiring"
    end
  end


  def any_items_display(items)
    if items.any?
      render partial: 'items', collection: @items
    else
      "You have no items"
    end
  end

  def any_item_types_display(item_types)
    if item_types.any?
      render partial: 'item_types', collection: @item_types
    else
      "You have no items"
    end
  end

end

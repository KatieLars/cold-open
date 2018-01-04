module FreezersHelper

  def freezer_link_format(freezer)
    if freezer.freezer_type
      "#{freezer.name} - #{freezer.freezer_type}"
    else
      "#{freezer.name}"
    end
  end

  def any_freezers(current_user)
    if current_user.freezers.any?
      render partial: "freezers", collection: @freezers
    else
      "You have no freezers"
    end
  end

  def any_items(current_user, f)
    if !current_user.items.empty?
      f.collection_check_boxes(:item_ids, current_user.items, :id, :title) 
    else
      "You have no items"
    end
  end


end

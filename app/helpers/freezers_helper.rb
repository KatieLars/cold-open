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

end

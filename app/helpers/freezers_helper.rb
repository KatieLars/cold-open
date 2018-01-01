module FreezersHelper

  def freezer_link_format(freezer)
    if freezer.freezer_type
      "#{freezer.name} - #{freezer.freezer_type}"
    else
      "#{freezer.name}"
    end  
  end

end

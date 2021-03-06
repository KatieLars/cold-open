module ItemTypesHelper

  def min_and_max(type)
    if type.storage_min
      "#{type.storage_min}-#{type.storage_max} months"
    else
      pluralize(type.storage_max, "month")
    end
  end

  def link_format(type)
    "#{type.title}: #{min_and_max(type)}"
  end


end

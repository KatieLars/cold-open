module ItemTypesHelper

  def min_and_max(type)
    "#{type.storage_min}-#{type.storage_max} months"
  end

  def link_format(type)
    "#{type.title}: #{min_and_max(type)}"
  end


end

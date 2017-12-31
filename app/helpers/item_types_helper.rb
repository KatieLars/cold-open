module ItemTypesHelper
  def link_format(type)
    "#{type.title}: #{type.storage_min}-#{type.storage_max} months"  
  end

end

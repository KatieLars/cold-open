class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :expiration_max, :expiration_min, :date_stored
end

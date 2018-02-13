class FreezerSerializer < ActiveModel::Serializer
  attributes :id, :name, :freezer_type
  has_many :items, serializer: FreezerItemSerializer
end

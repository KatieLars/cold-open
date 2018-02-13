class NoteSerializer < ActiveModel::Serializer
  attributes :id, :updated_at, :content, :created_at
  belongs_to :item
end

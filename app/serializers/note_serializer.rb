class NoteSerializer < ActiveModel::Serializer
  attributes :id, :updated_at, :content, :created_at
end

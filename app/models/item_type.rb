class ItemType < ApplicationRecord
  has_many :items
  has_many :users, -> { distinct }, through: :items
  validates :title, presence: true
  validates :storage_max, presence: true

end

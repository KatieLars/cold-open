class ItemType < ApplicationRecord
  has_many :items#wired
  has_many :users, through: :items
  
end

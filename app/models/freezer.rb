class Freezer < ApplicationRecord
  has_many :items
  has_many :users, -> { distinct }, through: :items

end

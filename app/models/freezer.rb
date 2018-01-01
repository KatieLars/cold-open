class Freezer < ApplicationRecord
  has_many :items
  has_many :user_freezers
  has_many :users, through: :user_freezers

end

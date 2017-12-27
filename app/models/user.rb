class User < ApplicationRecord
  has_secure_password
  has_many :user_freezers
  has_many :user_items
  has_many :freezers, through: :user_freezers
  has_many :items, through: :user_items
  has_many :notes #wired

end

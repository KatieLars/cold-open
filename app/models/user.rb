class User < ApplicationRecord
  has_secure_password
  #has_many :user_freezers #join table
  has_many :user_items
  has_many :items, through: :user_items
  has_many :freezers, through: :items
  has_many :notes #wired

end

class User < ApplicationRecord
  has_secure_password
  has_many :user_items
  has_many :items, through: :user_items
  has_many :item_types, -> { distinct }, through: :items
  has_many :freezers, -> { distinct }, through: :items
  has_many :notes #wired

  def self.from_omniauth(auth) #passes in a hash
    where(email: auth[:info][:email]).first_or_initialize.tap do |user|
      user.email = auth[:info][:email]
      user.uid = auth[:uid]
      user.username = auth[:info][:name]
      user.password = SecureRandom.hex
      user.image = auth[:info][:image]
      user.save!
    end
  end

end

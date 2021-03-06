class User < ApplicationRecord
  has_secure_password
  has_many :user_items
  has_many :items, through: :user_items
  has_many :item_types, -> { distinct }, through: :items
  has_and_belongs_to_many :freezers, {:join_table => :user_freezers}
  #has_many :freezers, -> { distinct }, through: :items
  has_many :notes

  def self.from_omniauth(auth)
    where(email: auth[:info][:email]).first_or_initialize.tap do |user|
      user.email = auth[:info][:email]
      user.uid = auth[:uid]
      user.username = auth[:info][:name]
      user.password = SecureRandom.hex
      user.image = auth[:info][:image] unless !!user.image
      user.save!
    end
  end

end

class User < ApplicationRecord
  has_secure_password
  has_many :user_items
  has_many :items, through: :user_items
  has_many :item_types, -> { distinct }, through: :items
  has_many :freezers, -> { distinct }, through: :items
  has_many :notes #wired

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      #user.provider = auth.provider
      user.email = auth.info.email
      user.uid = auth.uid
      user.username = auth.info.name
      #user.oauth_token = auth.credentials.token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end

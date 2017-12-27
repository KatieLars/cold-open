class Item < ApplicationRecord
  belongs_to :freezer #wired
  belongs_to :item_type #wired
  has_many :user_items
  has_many :users, through: :user_items
  has_many :notes #wired

  def expiration_date
    #finds the expiration date range for an item
  end

  def self.expired
    #lists all expired items
    #items are expired if past the max storage date
  end

  def self.expiring_soon
    #lists all items between storage min and storage_max
  end

  def self.still_good
    #lists all items that have yet to hit the storage min mark
  end

#special specs needed
end

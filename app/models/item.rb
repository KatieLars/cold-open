class Item < ApplicationRecord
  belongs_to :freezer #wired
  belongs_to :item_type #wired
  has_many :user_items
  has_many :users, through: :user_items
  has_many :notes #wired

  def expiration_date
    #finds the expiration date range for an item
  end

  def self.top_10_by_expiration
    #lists top 10 items by expiration date
    #should be by user collection  . .  .
  end

end

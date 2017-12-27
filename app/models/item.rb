class Item < ApplicationRecord
  belongs_to :freezer #wired
  belongs_to :item_type #wired
  has_many :user_items
  has_many :users, through: :user_items
  has_many :notes #wired


  def expiration_range_beginning #entering the min range of expiration
    if item_type.storage_min
      Chronic.parse("#{item_type.storage_min} from item.date_stored")
    end
  end

  def expiration_range_ending #maximum range
    Chronic.parse("#{item_type.storage_max} from item.date_stored")
  end

  def self.expired
    #lists all expired items
    #items are expired if past the max storage date
    expired = all.collect {|item| item if item.expiration_range_ending < Time.now}
    binding.pry #finds items where today's date it outside their max date range
  end

  def self.expiring_soon
    #lists all items between storage min and storage_max
    #finds items where today's date is inside their date range
  end

  def self.still_good
    #lists all items that have yet to hit the storage min mark
    #finds items where today's date is before entering the expiration range
  end

#special specs needed
end

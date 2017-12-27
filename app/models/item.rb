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
    x = Chronic.parse("#{item_type.storage_max} from item.date_stored")

  end

  def self.expired   #items are expired if today's date is past the max storage date
    expired_foods = []
    self.all.each {|item| expired_foods << item if item.expiration_range_ending < Time.now}
    expired_foods
  end

  def self.expiring_soon #lists all items between storage min and storage_max
    expiring_foods = [] #greater times are future times
    all.each do |item|
      if item.item_type.storage_min #if storage min value is present
        if Time.now < item.expiration_range_ending && Time.now > item.expiration_range_beginning
          expiring_foods << item
        end
      else
        if Time.now < item.expiration_range_ending
          expiring_foods << item
        end
      end
    end
    expiring_foods
  end

  def self.still_good
    still_good = []
    all.each do |item|
      binding.pry
      if !self.expiring_soon.include?(item) && !self.expired.include?(item)
        still_good << item
      end
    end
    still_good
    #lists all items that have yet to hit the storage min mark
    #finds items where today's date is before entering the expiration range
  end

#special specs needed
end

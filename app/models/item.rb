class Item < ApplicationRecord
  belongs_to :freezer #wired
  belongs_to :item_type #wired
  has_many :user_items
  has_many :users, through: :user_items
  has_many :notes #wired
  attr_reader :expiration_max, :expiration_min
  def expiration_min #entering the min range of expiration
    if item_type.storage_min
      Chronic.parse("#{item_type.storage_min} from item.date_stored")
    end
  end

  def expiration_max #maximum range
    Chronic.parse("#{item_type.storage_max} from item.date_stored")
  end

  def initialize
    item.exipiration_max = Chronic.parse("#{item_type.storage_max} from item.date_stored")
    item.expiration_min = Chronic.parse("#{item_type.storage_min} from item.date_stored") if item_type.storage_min
  end
  #consider a belongs_to to give yourself the expiration max and min as columns

  def expiration_range_beginning #entering the min range of expiration
    if item_type.storage_min
      Chronic.parse("#{item_type.storage_min} from item.date_stored")
    end
  end

  def expiration_range_ending #maximum range
    Chronic.parse("#{item_type.storage_max} from item.date_stored")
  end

  def self.expired   #items are expired if today's date is past the max storage date
    expired_foods = []
    all.each {|item| expired_foods << item if item.expiration_range_ending < Time.now}
    expired_foods
  end

  def self.expiring_soon #lists all items between storage min and storage_max
    expiring_foods = [] #greater times are future times
    all.each do |item|
      if item.item_type.storage_min #if storage min value is present
        expiring_foods << item if Time.now < item.expiration_range_ending && Time.now > item.expiration_range_beginning
      else
        expiring_foods << item if Time.now < item.expiration_range_ending
      end
    end
    expiring_foods
  end

  def self.still_good
    still_good = []
    all.each do |item|
      if !self.expiring_soon.include?(item) && !self.expired.include?(item)
        still_good << item
      end
    end
    still_good
  end

end

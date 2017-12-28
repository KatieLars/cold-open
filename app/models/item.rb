class Item < ApplicationRecord
  belongs_to :freezer #wired
  belongs_to :item_type #wired
  has_many :user_items
  has_many :users, through: :user_items
  has_many :notes #wiredn
  before_save :expiration_max
  before_save :expiration_min, if: :storage_min?

  def expiration_min #entering the min range of expiration
    #setter methods are problematic
    Chronic.parse("#{item_type.storage_min} from self.date_stored")
    #self.save
  end

  def expiration_max #maximum range
    #problematic setter method
    Chronic.parse("#{item_type.storage_max} from self.date_stored")
    #self.save
  end
  exp max = April 27, 2018
  stored =

  def self.expired   #items are expired if today's date is past the max storage date
    where("expiration_max < ?", Time.now)
    #expired_foods = []
    #all.each {|item| expired_foods << item if item.expiration_range_ending < Time.now}
    #expired_foods
  end

  def self.expiring_soon #lists all items between storage min and storage_max
    #where("expiration_max > ? AND expiration_min < ?", Time.now, Time.now)

    expiring_foods = []
#Client.where("orders_count = ? AND locked = ?", params[:orders], false)
    #greater times are future times
    all.each do |item|
      if item.item_type.storage_min #if storage min value is present
        expiring_foods << item if Time.now < item.expiration_max && Time.now > item.expiration_min
      else
        expiring_foods << item if Time.now < item.expiration_max
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

private

def storage_min? #returns true if storage_min exists
  !!item_type.storage_min
end


end

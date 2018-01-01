require 'pry'
class Item < ApplicationRecord
  belongs_to :freezer #wired
  belongs_to :item_type #wired
  has_many :user_items
  has_many :users, through: :user_items
  has_many :notes #wiredn
  validates :date_stored, presence: true
  validates :title, presence: true
  #before_save :date_conversion
  before_save :expiration_max_set
  before_save :expiration_min_set, if: :storage_min?
  accepts_nested_attributes_for :freezer
  accepts_nested_attributes_for :notes

  def notes_attributes=(note)
    if !note["0"]["content"].empty? #true if not empty
      self.notes.new(content: note["0"]["content"])
    end
  end

  def freezer_attributes=(freezer)
    self.freezer = Freezer.create(name: freezer[:name], freezer_type: freezer[:freezer_type])
  end

  def expiration_min_set #entering the min range of expiration
    #setter methods are problematic
    self.expiration_min = date_stored.months_since(item_type.storage_min.to_i)
  end

  def expiration_max_set #maximum range
    #problematic setter method
    self.expiration_max = self.date_stored.months_since(self.item_type.storage_max.to_i).to_datetime
  end

  def self.expiration_one_month
    where("expiration_max > ? AND expiration_max < ?", Time.now, Time.now.months_since(1))
  end

  def self.expiration_this_week
    where("expiration_max > ? AND expiration_max < ?", Time.now, Time.now.weeks_since(1))
  end

  def self.expired #items are expired if today's date is past the max storage date
    where("expiration_max < ?", Time.now)
  end

  def self.expiration_zone #lists all items between storage min and storage_max
    where("expiration_max > ? AND expiration_min < ?", Time.now, Time.now)
  end

  def self.still_good #hasn't reached expiration_min yet or max if only max
    where.not("id IN (?) OR id IN (?)", self.expiration_zone.pluck(:id), self.expired.pluck(:id))
  end

private

def storage_min? #returns true if storage_min exists
  !!item_type.storage_min
end

end

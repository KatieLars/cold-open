
class Item < ApplicationRecord
  belongs_to :freezer
  belongs_to :item_type
  has_many :user_items
  has_many :users, through: :user_items
  has_many :notes
  validates :date_stored, presence: true
  validates :title, presence: true
  before_save :expiration_max_set
  before_save :expiration_min_set, if: :storage_min?
  accepts_nested_attributes_for :freezer
  #accepts_nested_attributes_for :notes

  #def notes_attributes=(note)
#    if !note["0"]["content"].empty?
#      self.notes.first_or_initialize(content: note["0"]["content"], user_id: note["0"]["user_id"])
#    end
#  end

  def freezer_attributes=(freezer)
    freezie = Freezer.new(freezer)
    if freezie.valid?
      self.freezer = freezie
    end
  end

  def expiration_min_set
    self.expiration_min = date_stored.months_since(item_type.storage_min.to_i)
  end

  def expiration_max_set
    self.expiration_max = self.date_stored.months_since(self.item_type.storage_max.to_i).to_datetime
  end

  def self.expiration_one_month
    where("expiration_max > ? AND expiration_max < ?", Time.now, Time.now.months_since(1))
  end

  def self.expiration_this_week
    where("expiration_max > ? AND expiration_max < ?", Time.now, Time.now.weeks_since(1))
  end

  def self.expired
    where("expiration_max < ?", Time.now)
  end

  def self.expiration_zone
    where("expiration_max > ? AND expiration_min < ?", Time.now, Time.now)
  end

  def self.still_good
    where.not("id IN (?) OR id IN (?)", self.expiration_zone.pluck(:id), self.expired.pluck(:id))
  end

  def self.alphabetize
    order(:title)
  end

private

def storage_min?
  !!item_type.storage_min
end

end

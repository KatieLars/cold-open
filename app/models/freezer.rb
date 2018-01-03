class Freezer < ApplicationRecord
  has_many :items
  has_many :users, -> { distinct }, through: :items
  validates :name, presence: true
  accepts_nested_attributes_for :items

  def number_of_items
    self.items.count
  end

end

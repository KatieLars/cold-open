class Freezer < ApplicationRecord
  has_many :items
  has_many :users, -> { distinct }, through: :items
  validates :name, presence: true

  def number_of_items
    self.items.count
  end
end

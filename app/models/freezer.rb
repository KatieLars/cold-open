class Freezer < ApplicationRecord
  has_many :items
  has_many :users, -> { distinct }, through: :items
  validates :name, presence: true
  accepts_nested_attributes_for :items

  def number_of_items
    self.items.count
  end

  def items_attributes=(items_attributes)
    attr = items_attributes["0"]
    item = Item.new(title: attr[:title], item_type_id: attr[:item_type_id])
    item.date_stored = Chronic.parse(items_attributes["0"][:date_stored]).to_datetime
    item.users << User.find_by(id: attr[:user_ids][0])
    item.notes.build(attr[:note])
    self.items << item
  end

end

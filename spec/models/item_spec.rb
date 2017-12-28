require 'rails_helper'
require 'pry'


RSpec.describe Item, type: :model do
  before(:each) do
  @item = Item.first
  @item.users << User.second

  User.first.notes.create(item_id: @item.id)
  User.second.notes.create(item_id: @item.id)
end

it "has many users" do
  expect(@item.users.count).to eq(2)
end

it "belongs to a freezer" do
  binding.pry
  expect(@item.freezer.name).to eq(Freezer.first.name)
end

it "has many notes" do
  expect(@item.notes.count).to eq(2)
end

it "belongs to an item type" do
  expect(@item.item_type.title).to eq(ItemType.first.title)
end

it "has a maximum expiration date" do
  max_storage = @item.item_type.storage_max.to_i
  expect(@item.expiration_max).to eq(@item.date_stored.months_since(max_storage))
end

describe "::expired" do
  it "returns all item beyond their maximum storage date" do
      items = ["Captain Cook", "Captain Kidd", "Samuel Axe"]
      expect(Item.expired.pluck(:title)).to eq(items)
  end
end

describe "::expiring_soon" do
  it "returns items between their storage min and storage max dates" do
    items = []
    expect(Item.expiring_soon.pluck(:title)).to eq(items)
  end
end

describe "::still_good" do
  it "return items that have not yet reached their storage min" do
    items = []
    expect(Item.still_good.pluck(:title)).to eq(items)
  end
end



end

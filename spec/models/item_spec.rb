require 'rails_helper'
require 'pry'


RSpec.describe Item, type: :model do
  before(:each) do
  @item = Item.first
  @item.users << User.second

end

it "has many users" do
  expect(@item.users.count).to eq(2)
end

it "belongs to a freezer" do
  expect(@item.freezer.name).to eq(Freezer.first.name)
end

it "has many notes" do
  expect(@item.notes.count).to eq(2)
end

it "belongs to an item type" do
  expect(@item.item_type.title).to eq(ItemType.fourth.title)
end

it "has a maximum expiration date" do
  max_storage = @item.item_type.storage_max.to_i
  expect(@item.expiration_max).to eq(@item.date_stored.months_since(max_storage))
end

describe "::expired" do

  it "returns all item beyond their maximum storage date" do
      items = ["pizza", "Manwich", "cranberry pie", "peas"]
      expect(Item.expired.pluck(:title)).to eq(items)
  end
end

describe "::expiration_zone" do
  it "returns items between their storage min and storage max dates" do
    items = ["beef stew", "apple pie"]
    expect(Item.expiration_zone.pluck(:title)).to eq(items)
  end
end

describe "::still_good" do
  it "return items that have not yet reached their storage min" do
    items = ["casserole", "curry", "beef patties", "broth", "cow parts", "broccoli"]
    expect(Item.still_good.pluck(:title)).to eq(items)
  end
end

describe "::expiration_this_week" do
  it "returns a list of items that are expiring this week" do
    items = ["broth"]
    expect(Item.expiration_this_week.pluck(:title)).to eq(items)
  end
end

describe "::expiration_one_month" do
  it "returns a list of items expiring in the next month" do
    items = ["beef stew", "broth", "cow parts", "apple pie"]
    expect(Item.expiration_one_month.pluck(:title)).to eq(items)
  end
end



end

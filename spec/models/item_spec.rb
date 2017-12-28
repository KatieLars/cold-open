require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:each) do
  3.times do
    User.create(
      username: Faker::StarWars.character,
      password: Faker::StarWars.vehicle,
      email: "#{Faker::Lovecraft.deity}@gmail.com"
    )
  end

  3.times do
    Freezer.create(
      name: Faker::LordOfTheRings.location,
      freezer_type: Faker::GameOfThrones.house
    )
  end

  10.times do
    ItemType.create(
      title: Faker::Dune.character,
      storage_min: "#{rand(1..4)}",
      storage_max: "#{rand(5..10)}"
    )
  end

  @item = User.first.items.create(title: "Hot Dogs", item_type_id: ItemType.first.id, freezer_id: Freezer.first.id)
  @item.users << User.second

  User.first.notes.create(item_id: @item.id)
  User.second.notes.create(item_id: @item.id)
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
  expect(@item.item_type.title).to eq(ItemType.first.title)
end

it "has a maximum expiration date" do
  expeect(@item.expiration_max)
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

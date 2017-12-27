require 'rails_helper'

RSpec.describe Note, type: :model do
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
        storage_min: "#{rand(1..4)} months",
        storage_max: "#{rand(5..10)} months"
      )
    end

    @item = User.first.items.create(title: "Hot Dogs", item_type_id: ItemType.first.id, freezer_id: Freezer.first.id)
    @item2 = User.first.items.create(item_type_id: ItemType.second.id, freezer_id: Freezer.second.id)

    @note = User.first.notes.create(item_id: @item.id)
  end

  it "belongs to a user" do
    expect(@note.user.username).to eq(User.first.username)
  end

  it "belongs to an item" do
    expect(@note.item.title).to eq("Hot Dogs")
  end
end

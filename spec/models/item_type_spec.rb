require 'rails_helper'
require 'pry'

RSpec.describe ItemType, type: :model do
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

      @item_type = ItemType.create(
        title: Faker::Dune.character,
        storage_min: "#{rand(1..4)}",
        storage_max: "#{rand(5..10)}"
      )

    @item = @item_type.items.create(freezer_id: Freezer.first.id)
    @item.users << User.first
    @item.users << User.second
    @item2 = @item_type.items.create(freezer_id: Freezer.second.id)
    @item2.users << User.third
end

it "has many items" do
  expect(@item_type.items.count).to eq(2)
end

it "has many users" do
  expect(@item_type.users.count).to eq(3)

end
end

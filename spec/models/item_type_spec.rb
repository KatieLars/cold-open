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
        storage_min: "#{rand(1..4)} months",
        storage_max: "#{rand(5..10)} months"
      )

    @item = @item_type.items.create(freezer_id: Freezer.first.id)
    @item2 = @item_type.items.create(freezer_id: Freezer.second.id)

end

it "has many items" do
  expect(@item_type.items.count).to eq(2)
end
end

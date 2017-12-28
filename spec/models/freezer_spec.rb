require 'rails_helper'
require 'pry'

  RSpec.describe Freezer, type: :model do
    before(:each) do
      3.times do
        User.create(
          username: Faker::StarWars.character,
          password: Faker::StarWars.vehicle,
          email: "#{Faker::Lovecraft.deity}@gmail.com"
        )
      end

        @freezer = Freezer.create(
          name: Faker::LordOfTheRings.location,
          freezer_type: Faker::GameOfThrones.house
        )

      10.times do
        ItemType.create(
          title: Faker::Dune.character,
          storage_min: "#{rand(1..4)}",
          storage_max: "#{rand(5..10)}"
        )
      end

      @item = @freezer.items.create(item_type_id: ItemType.first.id)
      @item.users << User.first
      @item2 = @freezer.items.create(item_type_id: ItemType.second.id)
      @item2.users << User.second
    end

    it "has many items" do
      expect(@freezer.items.count).to eq(2)
    end

    it "has many users through items" do
      expect(@freezer.users.count).to eq(2)
    end


  end

require 'rails_helper'
require 'pry'

  RSpec.describe Freezer, type: :model do
    before(:each) do
      @user = User.create(
        username: "admin",
        password: "admin",
        email: "admin@gmail.com"
      )

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

      @item = @user.items.create(item_type_id: ItemType.first.id, freezer_id: Freezer.first.id)
      @item2 = @user.items.create(item_type_id: ItemType.second.id, freezer_id: Freezer.second.id)

    end

    it "has many items" do
      expect(@user.items.count).to eq(2)
    end

    it "has many freezers through items" do
      expect(@user.freezers.count).to eq(2)
    end

    it "has many notes" do
      @user.notes.create(item_id: @item.id)
      @user.notes.create(item_id: @item2.id)
      expect(@user.notes.count).to eq(2)
    end

  end

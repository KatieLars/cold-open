require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(
      username: "admin",
      password: "admin",
      email: "admin@gmail.com"
    )
    @freezer = Freezer.create(
        name: Faker::LordOfTheRings.location,
        freezer_type: Faker::GameOfThrones.house
      )
    @item_type = ItemType.create(
      title: "bread",
      storage_max: "3 months"
    )

  end

  it "has many items" do
    @user.items.create(item_type_id: @item_type.id, freezer_id: @freezer.id)
    binding.pry
    expect(@user.items.count).to eq(1)
  end

end

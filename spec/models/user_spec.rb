require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.first
  end

  it "has many items" do
    expect(@user.items.count).to eq(9)
  end

  it "has many freezers through items" do
    expect(@user.freezers.count).to eq(3)
  end

  it "has many notes" do
    expect(@user.notes.count).to eq(2)
  end

  it "has many item types" do
    binding.pry
    expect(@user.item_types.count).to eq(5)
  end


end

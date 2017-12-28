require 'rails_helper'
require 'pry'

RSpec.describe ItemType, type: :model do
  before(:each) do
  @type = ItemType.first
end

it "has many items" do
  expect(@type.items.count).to eq(2)
end

it "has many users" do
  expect(@type.users.count).to eq(2)
end

end

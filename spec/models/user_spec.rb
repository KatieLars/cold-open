require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(
      username: "admin",
      password: "admin",
      email: "admin@gmail.com"
    )
binding.pry
  end

  it "has many items" do
    @user.items.create
    expect(@user.items.count).to eq(1)
  end

end

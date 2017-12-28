require 'rails_helper'

RSpec.describe Note, type: :model do
  before(:each) do
   @note = Note.first
  end

  it "belongs to a user" do
    expect(@note.user.username).to eq(User.first.username)
  end

  it "belongs to an item" do
    expect(@note.item.title).to eq("casserole")
  end
end

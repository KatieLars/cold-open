require 'rails_helper'
require 'pry'

  RSpec.describe Freezer, type: :model do
    before(:each) do
      @freezer = Freezer.first
    end

    it "has many items" do
      expect(@freezer.items.count).to eq(5)
    end

    it "has many users through items" do
      expect(@freezer.users.count).to eq(2)
    end


  end

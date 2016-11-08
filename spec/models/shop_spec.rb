require 'rails_helper'

RSpec.describe Shop, type: :model do
  before(:all) do
    User.destroy_all
    Shop.destroy_all
    @lindeman = User.create(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @travis = User.create(first_name: "Bob", last_name: "Builder", password: "password", email: "tester2@test.com", mech_status: true)
    @oreilly = Shop.create(name: "O'Reilly", address: "636 Spruce St.", city: "San Francisco", state: "CA", zip_code: "94118")
  end

  context "shop creation" do
    it "creates the object(s) we need" do
      expect(Shop.all).to match_array([@oreilly])
    end
  end

  context "State validations" do
    it "- invalid if state not uppercase" do
      @test = Shop.create(name: "O'Reilly", address: "636 Spruce St.", city: "San Francisco", state: "Ca", zip_code: "94118")
      expect(@test.valid?).to eq(false)
    end

    it "- invalid if state is not a letter" do
      @test = Shop.create(name: "O'Reilly", address: "636 Spruce St.", city: "San Francisco", state: "C1", zip_code: "94118")
      expect(@test.valid?).to eq(false)
    end
  end

  context "Zip code validations" do
    it "- invalid if not strictly a numeric string" do
      @test = Shop.create(name: "O'Reilly", address: "636 Spruce St.", city: "San Francisco", state: "CA", zip_code: "9s118")
      expect(@test.valid?).to eq(false)
    end

    it "- invalid if length lower than 5" do
      @test = Shop.create(name: "O'Reilly", address: "636 Spruce St.", city: "San Francisco", state: "CA", zip_code: "9411")
      expect(@test.valid?).to eq(false)
    end

    it "- invalid if length over 5" do
      @test = Shop.create(name: "O'Reilly", address: "636 Spruce St.", city: "San Francisco", state: "CA", zip_code: "941187")
      expect(@test.valid?).to eq(false)
    end

    it "- invalid if nothing is supplied" do
      @test = Shop.create(name: "O'Reilly", address: "636 Spruce St.", city: "San Francisco", state: "CA")
      expect(@test.valid?).to eq(false)
    end
  end
end

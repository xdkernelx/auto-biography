require "rails_helper"

RSpec.describe Car, :type => :model do

  before(:all) do
    User.destroy_all
    Car.destroy_all
    @lindeman = User.create(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @star = Car.create(user_id: @lindeman.id, mileage: 100, vin: "11111111111111111")
    @dust = Car.create(user_id: @lindeman.id, mileage: 20, vin: "11111111111111119")
  end

  it "correctly associates the user" do
    expect(@star.user).to eq(@lindeman)
  end

  it "return false when the user is having an existential crisis" do
    @test = Car.new(user_id: 2, mileage: 1, vin: "333333FFFFFF66667")
    expect( @test.valid? ).to eq(false)
  end

  it "return false if the mileage is below 0" do
    @test = Car.new(user_id: @lindeman.id, mileage: -1, vin: "333333FFFFFF66667")
    expect( @test.valid? ).to eq(false)
    @test = Car.new(user_id: @lindeman.id, mileage: 0, vin: "333333FFFFFF66667")
    expect( @test.valid? ).to eq(false)
  end

  it "return true if the mileage is greater than 0" do
    @test = Car.new(user_id: @lindeman.id, mileage: 1, vin: "333333FFFFFF66667")
    expect( @test.valid? ).to eq(true)
  end

  it "return false if the VIN isn't alphanumeric" do
    @test = Car.new(user_id: @lindeman.id, mileage: 100, vin: "333333FFFFFF6666$")
    expect( @test.valid? ).to eq(false)
  end

  it "return true if the VIN isn't alphanumeric" do
    @test = Car.new(user_id: @lindeman.id, mileage: 100, vin: "333333FFFFFF66667")
    expect( @test.valid? ).to eq(true)
  end

end

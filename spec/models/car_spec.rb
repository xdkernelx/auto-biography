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

  it "return false if the VIN isn't alphanumeric" do
    @test = Car.new(user_id: @lindeman.id, mileage: 100, vin: "333333FFFFFF6666$")
    expect( @test.save ).to eq(false)
  end

end

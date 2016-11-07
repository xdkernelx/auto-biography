require 'rails_helper'

RSpec.describe Maintenance, type: :model do
  before(:each) do
    User.destroy_all
    Car.destroy_all
    Maintenance.destroy_all
    @lindeman = User.create(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @travis = User.create(first_name: "Bob", last_name: "Builder", password: "password", email: "tester2@test.com", mech_status: true)
    @star = Car.create(user_id: @lindeman.id, mileage: 100, vin: "11111111111111111")
    @dust = Car.create(user_id: @lindeman.id, mileage: 20, vin: "11111111111111119")
    @oil_change = Maintenance.create(car_id: @star.id, mechanic_id: @travis.id, title: "Scheduled Oil Change", description: "See Title", mileage: 200, date_completed: "11/04/2016")
    @alignment = Maintenance.create(car_id: @star.id, mechanic_id: @travis.id, title: "Scheduled Alignment", description: "Off by 1 degree", mileage: 200, date_completed: "11/04/2016")
  end

  it "allows multiple maintenance to be created" do
    expect(Maintenance.count).to eq(2)
  end

  it "doesn't allow a mileage to be 0 or below" do
    @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, title: "Scheduled Alignment", description: "Off by 1 degree", mileage: 0, date_completed: "11/04/2016")
    expect(@test.valid?).to eq(false)
    @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, title: "Scheduled Alignment", description: "Off by 1 degree", mileage: -1, date_completed: "11/04/2016")
    expect(@test.valid?).to eq(false)
  end

  it "has a parent association with a car" do
    expect(@oil_change.car).to eq(@star)
  end

  it "has a parent association with a user" do
    expect(@oil_change.car.user).to eq(@lindeman)
  end

  it "can get the list of all the cars by parent user" do
    expect(@oil_change.car.user.cars).to match_array([@star, @dust])
  end

end

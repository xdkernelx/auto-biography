require "rails_helper"

RSpec.describe Issue, :type => :model do

  before(:all) do
    User.destroy_all
    Car.destroy_all
    Issue.destroy_all
    @lindeman = User.create(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @star = Car.create(user_id: @lindeman.id, mileage: 100, vin: "11111111111111111")
    @dust = Car.create(user_id: @lindeman.id, mileage: 20, vin: "11111111111111119")
    @engine = Issue.create(car_id: @star.id, title: "Tail Light Problem", description: "The light will not turn on")
    @tail_light = Issue.create(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true)
  end

  it "Allows several Issue creations to be valid" do
    expect(@tail_light.valid?).to eq(true)
    expect(@tail_light.open).to eq(true)
  end

  it "It associates to a car" do
    expect(@tail_light.car).to eq(@star)
  end

  it "It associates to a car to a user" do
    expect(@tail_light.car.user).to eq(@lindeman)
  end

  it "Does not allow an urgency level at 0 or below" do
    @dashboard_light = Issue.new(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true, urgency: 0)
    expect(@dashboard_light.valid?).to eq(false)
    @dashboard_light = Issue.new(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true, urgency: -1)
    expect(@dashboard_light.valid?).to eq(false)
  end

  it "Does not allow an urgency level at 6 or above" do
    @dashboard_light = Issue.new(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true, urgency: 6)
    expect(@dashboard_light.valid?).to eq(false)
    @dashboard_light = Issue.new(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true, urgency: 20)
    expect(@dashboard_light.valid?).to eq(false)
  end

  it "Does allow a number between 1 and 5, inclusively" do
    @dashboard_light = Issue.new(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true, urgency: 5)
    expect(@dashboard_light.valid?).to eq(true)
    @dashboard_light = Issue.new(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true, urgency: 1)
    expect(@dashboard_light.valid?).to eq(true)
  end

end

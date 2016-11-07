require 'rails_helper'

RSpec.describe Repair, type: :model do
  before(:all) do
    User.destroy_all
    Car.destroy_all
    Issue.destroy_all
    Repair.destroy_all
    @lindeman = User.create(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @travis = User.create(first_name: "Bob", last_name: "Builder", password: "password", email: "tester2@test.com", mech_status: true)
    @star = Car.create(user_id: @lindeman.id, mileage: 100, vin: "11111111111111111")
    @dust = Car.create(user_id: @lindeman.id, mileage: 20, vin: "11111111111111119")
    @engine = Issue.create(car_id: @star.id, title: "Tail Light Problem", description: "The light will not turn on")
    @tail_light = Issue.create(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true)
    @tail_light_fix = Repair.create(issue_id: @tail_light.id, mechanic_id: @travis.id, title: "Tail Light Wiring", description: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
    @engine_fix = Repair.create(issue_id: @engine.id, mechanic_id: @travis.id, title: "Engine dead", description: "Engine is dead. Please buy a new one", mileage: 3200, date_completed: "11/04/2016")
  end

  it "Allows several Issue creations to be valid" do
    expect(Repair.find(@tail_light_fix.id)).to eq(@tail_light_fix)
    expect(Repair.find(@engine_fix.id)).to eq(@engine_fix)
  end

  it "Tests several presence validations" do
    @test = Repair.new(issue_id: @tail_light.id, description: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
    expect(@test.valid?).to eq(false)

    @test = Repair.new(issue_id: @tail_light.id, title: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
    expect(@test.valid?).to eq(false)

    @test = Repair.new(issue_id: @tail_light.id, title: "Tail light wiring messing with the engine", description: "Tail light wiring messing with the engine", date_completed: "11/04/2016")
    expect(@test.valid?).to eq(false)

    @test = Repair.new(issue_id: @tail_light.id, title: "Tail light wiring messing with the engine", description: "Tail light wiring messing with the engine", mileage: 3200)
    expect(@test.valid?).to eq(false)
  end

  it "Doesn't allow a title to be more than 64 characters" do
    @test = Repair.new(issue_id: @tail_light.id, mechanic_id: @travis.id, title: "1234567890123456789012345678901234567890123456789012345678901234", description: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
    expect(@test.valid?).to eq(true)

    @test = Repair.new(issue_id: @tail_light.id, mechanic_id: @travis.id, title: "12345678901234567890123456789012345678901234567890123456789012345", description: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
    begin
      @test.save
    rescue
      @test = nil
    end

    expect( @test ).to eq(nil)
  end

end

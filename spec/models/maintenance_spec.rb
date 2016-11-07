require 'rails_helper'

RSpec.describe Maintenance, type: :model do
  before(:all) do
    User.destroy_all
    Car.destroy_all
    Issue.destroy_all
    Repair.destroy_all
    Maintenance.destroy_all
    @lindeman = User.create(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @travis = User.create(first_name: "Bob", last_name: "Builder", password: "password", email: "tester2@test.com", mech_status: true)
    @star = Car.create(user_id: @lindeman.id, mileage: 100, vin: "11111111111111111")
    @dust = Car.create(user_id: @lindeman.id, mileage: 20, vin: "11111111111111119")
    @engine = Issue.create(car_id: @star.id, title: "Tail Light Problem", description: "The light will not turn on")
    @tail_light = Issue.create(car_id: @star.id, title: "Engine won't turn on", description: "See Title", open: true)
    @back_light = Issue.create(car_id: @dust.id, title: "Engine won't turn on", description: "See Title")
    @tail_light_fix = Repair.create(issue_id: @tail_light.id, mechanic_id: @travis.id, title: "Tail Light Wiring", description: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
    @engine_fix = Repair.create(issue_id: @engine.id, mechanic_id: @travis.id, title: "Engine dead", description: "Engine is dead. Please buy a new one", mileage: 3200, date_completed: "11/04/2016")
    @oil_change = Maintenance.create(car_id: @star.id, mechanic_id: @travis.id, title: "Scheduled Oil Change", description: "See Title", mileage: 200, date_completed: "11/04/2016")
    @alignment = Maintenance.create(car_id: @star.id, mechanic_id: @travis.id, title: "Scheduled Alignment", description: "Off by 1 degree", mileage: 200, date_completed: "11/04/2016")
    @tire_change = Maintenance.create(car_id: @dust.id, mechanic_id: @travis.id, title: "Scheduled Alignment", description: "Off by 1 degree", mileage: 200, date_completed: "11/04/2016")
 end
 context "maintenance creation" do
    it "allows multiple maintenance to be created" do
      expect(Maintenance.all).to match_array([@oil_change, @alignment, @tire_change])
    end
  end

  context "nested parent assocations" do
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

  context "Presence validations" do
    it "- title" do
      @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, description: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
      expect(@test.valid?).to eq(false)
    end

    it "- description" do
      @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, title: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
      expect(@test.valid?).to eq(false)
    end

    it "- mileage" do
      @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, title: "Tail light wiring messing with the engine", description: "Tail light wiring messing with the engine", date_completed: "11/04/2016")
      expect(@test.valid?).to eq(false)
    end

    it "- date_completed" do
      @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, title: "Tail light wiring messing with the engine", description: "Tail light wiring messing with the engine", mileage: 3200)
      expect(@test.valid?).to eq(false)
    end
  end

  context "mileage validations" do
    it "doesn't allow a mileage to be 0 or below" do
      @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, title: "Scheduled Alignment", description: "Off by 1 degree", mileage: 0, date_completed: "11/04/2016")
      expect(@test.valid?).to eq(false)
      @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, title: "Scheduled Alignment", description: "Off by 1 degree", mileage: -1, date_completed: "11/04/2016")
      expect(@test.valid?).to eq(false)
    end
  end

  context "Mechanic validation" do
    it "checks validity of mechanic if mechanic_id is supplied" do
      @test = Maintenance.new(car_id: @star.id, mechanic_id: 0, title: "1234567890123456789012345678901234567890123456789012345678901234", description: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
      expect(@test.valid?).to eq(false)
      @test = Maintenance.new(car_id: @star.id, mechanic_id: @travis.id, title: "1234567890123456789012345678901234567890123456789012345678901234", description: "Tail light wiring messing with the engine", mileage: 3200, date_completed: "11/04/2016")
      expect(@test.valid?).to eq(true)
    end
  end

end

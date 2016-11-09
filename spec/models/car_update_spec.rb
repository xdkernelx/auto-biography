require "rails_helper"

RSpec.describe Car, :type => :model do

  before(:all) do
    User.destroy_all
    Car.destroy_all
    Issue.destroy_all
    Repair.destroy_all
    Maintenance.destroy_all
    Permission.destroy_all
    Shop.destroy_all
    Ticket.destroy_all
    Comment.destroy_all
    @lindeman = User.create(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @travis = User.create(first_name: "Bob", last_name: "Builder", password: "password", email: "tester2@test.com", mech_status: true)
    @star = Car.create(user_id: @lindeman.id, mileage: 61000, vin: "11111111111111111")
    @dust = Car.create(user_id: @lindeman.id, mileage: 20, vin: "11111111111111119")
    @matter = Car.create(user_id: @lindeman.id, mileage: 20, vin: "11111111111111119")
    @oreilly = Shop.create(name: "O'Reilly", mechanic_id: @travis.id, address: "636 Spruce St.", city: "San Francisco", state: "CA", zip_code: "94118")
    @oil_change = Maintenance.create(car_id: @star.id, shop_id: @oreilly.id, title: "oil change", description: "See Title", mileage: 60000, date_completed: "11/04/2016")
    @service = Maintenance.create(car_id: @star.id, shop_id: @oreilly.id, title: "service", description: "See Title", mileage: 60000, date_completed: "11/04/2016")
    @alignment = Maintenance.create(car_id: @star.id, shop_id: @oreilly.id, title: "Scheduled Alignment", description: "Off by 1 degree", mileage: 200, date_completed: "11/05/2016")
end

  context "parent assocation" do
    it "correctly associates the user" do
      expect(@star.user).to eq(@lindeman)
    end

    it "return false when the user is having an existential crisis" do
      @test = Car.new(user_id: 0, mileage: 1, vin: "333333FFFFFF66667")
      expect( @test.valid? ).to eq(false)
    end
  end

  context "Car.oil_change?" do
    it "- returns 1000 if the Car.mileage is 61000 and the recent 'oil change' maintenance is at 60000" do
      expect(@star.oil_change?).to eq(1000)
    end
  end

  context "Car.service?" do
    it "- returns 1000 if the Car.mileage 61000 and the most recent 'service' maintenance is at 60000" do
      expect(@star.service?).to eq(1000)
    end
  end

end

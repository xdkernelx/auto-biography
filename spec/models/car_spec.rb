require "rails_helper"

RSpec.describe Car, :type => :model do

  before(:all) do
    @lindeman = User.create!(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @star = Car.create!(user_id: 1, mileage: 100, vin: "11111111111111111")
    @dust = Car.create!(user_id: 1, mileage: 20, vin: "11111111111111119")
  end

  it "creates correct amount based on before call" do
    expect(Car.count).to eq(2)
  end

  it "correctly associates the user" do
    p @star.user
    expect(@star.user).to eq(@lindeman)
  end

end

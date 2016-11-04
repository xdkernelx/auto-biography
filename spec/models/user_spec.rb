require "rails_helper"

RSpec.describe User, :type => :model do

  before(:each) do
    User.destroy_all
    @lindeman = User.create!(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @chelimsky = User.create!(first_name: "David", last_name: "Chelimsky", password: "password", email: "tester2@test.com")
  end

  it "allows the phone entry to be blank" do
    expect(@lindeman.phone).to eq(nil)
  end

  it "is invalid if the email is already taken" do
    @test = User.new(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    expect(@test.valid?).to eq(false)
  end

  it "is invalid if the password is below 6" do
    @test = User.new(first_name: "Andy", last_name: "Lindeman", password: "12345", email: "different@test.com")
    expect(@test.valid?).to eq(false)
  end

  it "checks if the phone integer is 10" do
    @test = User.new(first_name: "Andy", last_name: "Lindeman", phone: 1234567891, password: "123456", email: "different@test.com")
    expect(@test.valid?).to eq(true)
  end

  it "checks if the phone integer is below or greater than size: 10 " do
    @test = User.new(first_name: "Andy", last_name: "Lindeman", phone: 123456789, password: "123456", email: "different@test.com")
    expect(@test.valid?).to eq(false)
    @test = User.new(first_name: "Andy", last_name: "Lindeman", phone: 12345678912, password: "123456", email: "different@test.com")
    expect(@test.valid?).to eq(false)
  end

end

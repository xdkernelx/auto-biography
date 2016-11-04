require "rails_helper"

RSpec.describe User, :type => :model do
  it "orders by last name" do
    lindeman = User.create!(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    chelimsky = User.create!(first_name: "David", last_name: "Chelimsky", password: "password", email: "tester2@test.com")

    expect(User.count).to eq(2)
  end

  it "allows the phone entry to be blank" do
    lindeman = User.create!(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    expect(lindeman.phone).to eq(nil)
  end

end

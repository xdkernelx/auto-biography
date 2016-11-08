require 'rails_helper'

RSpec.describe Ticket, type: :model do
  before(:all) do
    User.destroy_all
    Car.destroy_all
    Issue.destroy_all
    Repair.destroy_all
    Maintenance.destroy_all
    Permission.destroy_all
    Shop.destroy_all
    Ticket.destroy_all
    @lindeman = User.create(first_name: "Andy", last_name: "Lindeman", password: "password", email: "tester@test.com")
    @travis = User.create(first_name: "Bob", last_name: "Builder", password: "password", email: "tester2@test.com", mech_status: true)
    @oreilly = Shop.create(name: "O'Reilly", address: "636 Spruce St.", city: "San Francisco", state: "CA", zip_code: "94118")
    @stranded = Ticket.create(title: "SOS", description: "Please come get me")
  end
end

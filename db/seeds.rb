# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(first_name: "Sponge", last_name: "Bob", phone: "222-333-4444", password: "password")
c1 = Car.create(vin: "3VWSE69M35M029058", mileage: 32555)
i1 = Issue.create(title: "engine light on", description: "engine light turned on today", urgency: 4)
r1 = Repair.create(title: "fixed engine light", description: "did not turn gas cap all the way", mileage: 32570, date_completed: "11/4/2016")
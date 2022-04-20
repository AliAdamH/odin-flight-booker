# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Step 1: Create  Airports.

airports_codes = %w[ATL DFW DEN ORD LAX CLT MCO CAN CTU LAS PHX MIA IST SZX SEA MEX CKG IAH SHA PEK]

airports = []
airports_codes.each do |airport|
  airports << Airport.create(code: airport)
end


# Step 2: Create Flights (20*20 Flights)
airports.each do |departure|
  airports.each do |destination|
    next if departure == destination

    Flight.create(
      departure_airport: departure,
      arrival_airport: destination,
      start: Faker::Time.forward(days: 30),
      duration: rand(600)
    )

    end
end






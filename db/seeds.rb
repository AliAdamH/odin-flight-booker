# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Step 1: Create  Airports.
require 'set'
require 'json'
file = File.read '../airports.json'
data_hash = JSON.parse file

airports_set = Set.new
110.times do
  airports_set.add data_hash.sample['iata']
end

airports_set.each do |airport|
  Airport.create(code: airport)
end

# Step 2: Create Flights (50 Flights)
(2..100).step(2) do |i|
  Flight.create(
    departure_airport_id: i,
    arrival_airport_id: i - 1,
    start: Faker::Time.forward(days: 30),
    duration: rand(600)
  )
end

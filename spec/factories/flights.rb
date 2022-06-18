FactoryBot.define do
  factory :flight do
    departure_airport { create(:airport) }
    arrival_airport { create(:airport, code: 'LAX') }
    start { Date.today + 1 }
    duration { 300 }
  end
end
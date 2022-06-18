FactoryBot.define do
  factory :flight do
    departure_airport { create(:airport) }
    arrival_airport { create(:airport, code: 'LAX') }
    start { Time.now + 1.day }
    duration { 300 }
  end
end
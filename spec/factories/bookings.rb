FactoryBot.define do
  factory :booking do
    flight { create(:flight) }
  end
end
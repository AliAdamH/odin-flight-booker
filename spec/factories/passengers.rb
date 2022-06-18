FactoryBot.define do
  factory :passenger do
    name { 'Potato potato' }
    email { 'potato@potato.com' }
    booking { create(:booking) }
  end
end
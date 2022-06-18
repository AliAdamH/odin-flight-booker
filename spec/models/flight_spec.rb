require 'rails_helper'

RSpec.describe Flight, type: :model do
  it 'has a valid factory' do
    expect(create(:flight)).to be_valid
  end


  context 'Associations' do
    it 'belongs to a departure airport' do
      expect(described_class.reflect_on_association(:departure_airport).macro).to eq(:belongs_to)
    end 

    it 'belongs to a departure airport' do
      expect(described_class.reflect_on_association(:arrival_airport).macro).to eq(:belongs_to)
    end 
  end

  describe '.available_flights' do
    it 'returns flight objects' do
      datetime = Time.now + 1.day
      flight = create(:flight)
      returned_flights = described_class.available_flights(
        day: datetime.day,
        month: datetime.month,
        year: datetime.year,
        departure: flight.departure_airport,
        arrival: flight.arrival_airport
      )
      expect(returned_flights).to include(flight)
    end 
  end
end
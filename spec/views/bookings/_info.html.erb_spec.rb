require 'rails_helper'
RSpec.describe 'bookings/_info.html.erb', type: :view do
  # Should this partial belong to flights instead ?
  context 'When a customer books a flight' do
    it 'displays the flight info' do
      flight = create(:flight)
      render partial: 'bookings/info' ,formats: %i[html], locals: { flight: flight }

      expect(rendered).to include("#{flight.id}")
      expect(rendered).to include("#{flight.departure_airport.code}")
      expect(rendered).to include("#{flight.id}")
    end
  end
end
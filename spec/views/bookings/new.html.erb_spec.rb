RSpec.describe 'bookings/new.html.erb', type: :view do

  let(:booking) { Booking.new }

  context 'When a customer selects a flight to book' do
    it 'displays the booking form' do
      flight = create(:flight)
      assign(:flight, flight)
      assign(:booking , booking)
      assign(:passengers, booking.passengers.build )

      render
    
      expect(rendered).to match(/Informations for passenger/)
      expect(rendered).to include("#{flight.id}")
      expect(rendered).to include("#{flight.departure_airport.code}")
      expect(rendered).to include("#{flight.id}")
    end
  end
end
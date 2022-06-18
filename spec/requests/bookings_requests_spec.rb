RSpec.describe "Booking Requests", type: :request do

  # Ensure you handle the unhappy paths for the booking controller.
  describe "GET /bookings#new" do
    context 'When given appropriate params' do
      it 'renders the form for the booking' do
        flight = create(:flight)
        booking_params = {
          flight_id: flight.id,
          num_tickets: 1
        }
        get new_booking_path(booking_params)
        expect(response.body).to include('form')
        expect(response.status).to eq 200
      end
    end
  end

  describe "POST /bookings#create" do
    it 'redirects to the bookings page' do
      flight = create(:flight)
      passenger = attributes_for(:passenger)
      post bookings_path(
        booking: {
        flight_id: flight.id,
        passengers_attributes: {
          '0': passenger
        }
      }
      )

      expect(response.status).to eq(302)
      expect(response).to redirect_to(booking_path(Booking.last)) 
    end
  end
end
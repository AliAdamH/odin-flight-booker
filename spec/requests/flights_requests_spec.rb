RSpec.describe 'Flights Request', type: :request do

  describe "GET /flights" do

    context 'Without any params(initially)' do
      it 'returns a populated  search form' do
        get flights_path
        expect(response.body).to include('Search')
        expect(response.status).to eq 200
      end
    end

    context 'When a visitor submits the search form' do
      it 'renders the results' do
        flight = create(:flight)
        flight_params = {
          departure_code: flight.departure_airport.id,
          arrival_code: flight.arrival_airport.id,
          day: flight.start.day,
          month: flight.start.month,
          year: flight.start.year,
          commit: true
        }
        get flights_path(flight_params)
        
        #Maybe it'd be a better idea to give the flight result box an id
        #And then test on the box appearing rather a specific result.
        expect(response.body).to include("Flight Number: #{flight.id}")
        expect(response.status).to eq 200
      end
    end
  end
end
RSpec.describe "Flight Search", type: :system do

  context 'When a visitor enters flight details of a NON-EXISTING flight' do
    it 'Shows no available flight' do
      flight = create(:flight)
      visit root_path


      select flight.departure_airport.code, from: 'departure_code'
      select flight.departure_airport.code, from: 'arrival_code'
      select 1, from: 'num_tickets'
      select flight.start.day, from: 'day'
      select flight.start.month, from: 'month'
      select flight.start.year, from: 'year'

      click_button 'Search'

      expect(page).to have_content('No flights available')
    end
  end

  context 'When a visitor enters flight details of an EXISTING flight' do
    it 'Shows the available flight and the booking option' do
      flight = create(:flight)
      visit root_path


      select flight.departure_airport.code, from: 'departure_code'
      select flight.arrival_airport.code, from: 'arrival_code'
      select 1, from: 'num_tickets'
      select flight.start.day, from: 'day'
      select flight.start.month, from: 'month'
      select flight.start.year, from: 'year'

      click_button 'Search'

      expect(page).to have_content("Flight Number: #{flight.id}")
      expect(page).to have_button('book')
    end
  end


end
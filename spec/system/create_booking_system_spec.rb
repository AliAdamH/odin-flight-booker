RSpec.describe "Create Booking", type: :system do

  context 'When a visitor chooses an available flight and books it' do
    it 'Displays the booking page' do
      flight = create(:flight)
      visit new_booking_path(
        flight_id: flight.id,
        num_tickets: 1
      )

      fill_in 'booking_passengers_attributes_0_name', with: 'Potato'
      fill_in 'booking_passengers_attributes_0_email', with: 'Potato@potato.com'

      click_button('Apply')

      expect(page).to have_content('You have succesfully booked your flight')
      expect(page).to have_content('Passenger Info')
    end
  end
end
RSpec.describe 'bookings/show.html.erb', type: :view do

  context 'After a customer creates a booking successfully' do
    it 'Displays all the informations of a booking' do
      booking = create(:booking)
      assign(:booking, booking)

      render

      expect(rendered).to have_content("Booking number : #{booking.id}")
    end
  end
end
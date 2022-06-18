require 'rails_helper'

RSpec.describe PassengerMailer, type: :mailer do
  describe "#success_email" do
    let(:passenger) { create(:passenger) }
    let(:mail) { PassengerMailer.with(passenger: passenger).success_email }

    it 'renders the header' do
      expect(mail.subject).to eq('You have booked a flight !')
      expect(mail.to).to include(passenger.email)
      expect(mail.from).to include('from@example.com')
    end

    it 'renders the body' do
      expect(mail.body).to include(passenger.name)
    end
  end
end
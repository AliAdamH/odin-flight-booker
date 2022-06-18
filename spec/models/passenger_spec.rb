RSpec.describe Passenger, type: :model do
  it 'has a valid factory' do
    expect(create(:passenger)).to be_valid
  end


  context 'Associations' do
    it 'belongs to a booking' do
      expect(described_class.reflect_on_association(:booking).macro).to eq(:belongs_to)
    end
  end

  context 'Validations' do
    it 'is invalid without a name' do
      passenger = build(:passenger, name: nil)
      expect(passenger).not_to be_valid
    end

    it 'is invalid without an email' do
      passenger = build(:passenger, email: nil)
      expect(passenger).not_to be_valid
    end
  end
end
RSpec.describe Booking, type: :model do
  it 'has a valid factory' do
    expect(create(:booking)).to be_valid
  end

  context 'Associations' do
    it 'belongs to a flight' do
      expect(described_class.reflect_on_association(:flight).macro).to eq(:belongs_to)
    end

    it 'has many passengers' do
      expect(described_class.reflect_on_association(:passengers).macro).to eq(:has_many)
    end
  end
end 
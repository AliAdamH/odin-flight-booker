require 'rails_helper'
RSpec.describe Airport, type: :model do
  it 'has a valid factory' do
    expect(create(:airport)).to be_valid
  end

  context 'Associations' do

    it 'has many departing flights' do
      expect(described_class.reflect_on_association(:departing_flights).macro).to eq(:has_many)
    end

    it 'has may arriving flights' do
      expect(described_class.reflect_on_association(:arriving_flights).macro).to eq(:has_many)
    end

  end
end
require 'rails_helper'

RSpec.describe Building, type: :model do
  it { should_have_many(:utility_meters) }

  describe 'validations' do
    it { should validate_presence_of(:display_name) }
    it { should validate_presence_of(:primary_property_type) }
    it { should validate_presence_of(:gross_square_feet) }
    it { should validate_presence_of(:address_line_1) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }

    it { should validate_numericality_of(:gross_square_feet) }

    describe '#primary_property_type' do
      let(:building) { build(:building) }

      it 'allows accepted property types' do
        building.primary_property_type = 'Office'
        expect(building.save).to eq true
      end

      it 'rejects bad property types' do
        building.primary_property_type = 'something'
        expect(building.save).to eq false
      end
    end
  end
end

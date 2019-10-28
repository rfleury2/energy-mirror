require 'rails_helper'

RSpec.describe UtilityMeter, type: :model do
  it { should belong_to(:utility_account) }
  it { should have_many(:utility_bills) }

  describe 'validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:meter_number) }
    it { should validate_presence_of(:service_address) }

    describe 'building' do
      context 'with an associated building' do
        let(:utility_meter) { create(:utility_meter) }

        it 'saves' do
          expect(utility_meter.save).to eq true
        end
      end

      context 'without an associated building' do
        let(:utility_meter) { create(:utility_meter, :no_building) }

        it 'saves' do
          expect(utility_meter.save).to eq true
        end
      end
    end
  end

  describe '#active?' do
    context 'active meter' do
      let(:utility_meter) { build(:utility_meter) }

      it 'translates to Electricity' do
        expect(utility_meter).to be_active
      end
    end

    context 'inactive meter' do
      let(:utility_meter) { build(:utility_meter, :inactive) }

      it 'translates to Electricity' do
        expect(utility_meter).to_not be_active
      end
    end
  end
end

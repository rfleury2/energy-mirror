require 'rails_helper'

RSpec.describe UtilityBill, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:utility_data_provider_id) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:total_cost) }
    it { should validate_presence_of(:total_volume) }
    it { should validate_presence_of(:consumption_unit) }

    it { should validate_numericality_of(:total_cost) }
    it { should validate_numericality_of(:total_volume) }
  end

  describe 'utility_data_provider' do
    context 'with utility_api' do
      let(:utility_bill) { build(:utility_bill) }

      it 'saves' do
        expect(utility_bill.save).to eq true
      end
    end

    context 'with manual' do
      let(:utility_bill) { build(:utility_bill, :manual) }

      it 'saves' do
        expect(utility_bill.save).to eq true
      end
    end

    context 'without an associated building' do
      let(:utility_bill) { build(:utility_bill, utility_data_provider_name: 'something') }

      it 'saves' do
        expect(utility_bill.save).to eq false
      end
    end
  end

  describe '.electric' do
    let!(:electric_bill) { create(:utility_bill, consumption_unit: 'kwh') }
    let!(:gas_bill) { create(:utility_bill, consumption_unit: 'therms') }

    it 'selects only electric bill' do
      electric = UtilityBill.electric
      expect(electric).to include electric_bill
      expect(electric).to_not include gas_bill
    end
  end

  describe '.natural_gas' do
    let!(:electric_bill) { create(:utility_bill, consumption_unit: 'kwh') }
    let!(:gas_bill) { create(:utility_bill, consumption_unit: 'therms') }

    it 'selects only natural_gas bill' do
      natural_gas = UtilityBill.natural_gas
      expect(natural_gas).to include gas_bill
      expect(natural_gas).to_not include electric_bill
    end
  end
end

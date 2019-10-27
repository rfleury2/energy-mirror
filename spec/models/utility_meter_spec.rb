require 'rails_helper'

RSpec.describe UtilityMeter, type: :model do
  it { should belong_to(:utility_account) }
  it { should belong_to(:building) }

  describe 'validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:meter_number) }
    it { should validate_presence_of(:service_address) }

    describe '#resource_type' do
      let(:utility_account) { build(:utility_account) }

      it 'allows accepted property types' do
        utility_account.resource_type = 'electricity'
        expect(utility_account.save).to eq true
      end

      it 'rejects bad property types' do
        utility_account.resource_type = 'something else'
        expect(utility_account.save).to eq false
      end
    end

    describe '#utility_data_provider_name' do
      let(:utility_account) { build(:utility_account) }

      it 'allows accepted provider name' do
        expect(utility_account.save).to eq true
      end

      it 'rejects bad provider name' do
        utility_account.utility_data_provider_name = 'something else'
        expect(utility_account.save).to eq false
      end
    end
  end


  describe '#display_resource_type' do
    context 'electricity' do
      let(:utility_account) { build(:utility_account, resource_type: 'electricity') }

      it 'translates to Electricity' do
        expect(utility_account.display_resource_type).to eq 'Electricity'
      end
    end

    context 'natural_gas' do
      let(:utility_account) { build(:utility_account, resource_type: 'natural_gas') }

      it 'translates to Natural Gas' do
        expect(utility_account.display_resource_type).to eq 'Natural Gas'
      end
    end
  end
end

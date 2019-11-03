require 'rails_helper'

RSpec.describe UtilityAccount, type: :model do
  it { should have_many(:utility_meters) }
  it { should belong_to(:organization) }

  describe 'validations' do
    it { should validate_presence_of(:customer_email) }
    it { should validate_presence_of(:utility_name) }
    it { should validate_presence_of(:resource_type) }

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

    describe 'utility_data_provider' do
      context 'with utility_api' do
        let(:utility_account) { build(:utility_account) }

        it 'saves' do
          expect(utility_account.save).to eq true
        end
      end

      context 'with manual' do
        let(:utility_account) { build(:utility_account, :manual) }

        it 'saves' do
          expect(utility_account.save).to eq true
        end
      end

      context 'without an associated building' do
        let(:utility_account) { build(:utility_account, utility_data_provider_name: 'something') }

        it 'saves' do
          expect(utility_account.save).to eq false
        end
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

require 'rails_helper'

RSpec.describe UtilityBill, type: :model do
  it { should validate_presence_of(:utility_data_provider_id) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:total_cost) }
  it { should validate_presence_of(:total_volume) }
  it { should validate_presence_of(:consumption_unit) }

  it { should validate_numericality_of(:total_cost) }
  it { should validate_numericality_of(:total_volume) }
end

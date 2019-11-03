require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { should have_many(:users) }
  it { should have_many(:buildings) }
  it { should have_many(:utility_accounts) }

  it { should validate_presence_of(:display_name) }
end

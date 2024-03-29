FactoryBot.define do
  factory :utility_meter do
    utility_account { build(:utility_account) }
    building { build(:building) }
    utility_data_provider_name { 'utility_api' }
    utility_data_provider_id { '12345' }
    meter_number { '01231-001' }
    service_address { Faker::Address.full_address }
    status { 'active' }

    trait :inactive do
      status { 'inactive' }
    end

    trait :no_building do
      building { nil }
    end

    trait :manual do
      utility_data_provider_name { 'manual' }
    end
  end
end

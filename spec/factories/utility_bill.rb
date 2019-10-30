FactoryBot.define do
  factory :utility_bill do
    utility_meter { build(:utility_meter) }
    utility_data_provider_name { 'utility_api' }
    utility_data_provider_id { '12345' }
    end_date { 30.days.ago }
    start_date { 60.days.ago }
    statement_date { 15.days.ago }
    total_cost { Faker::Number.between }
    total_volume { Faker::Number.between }
    consumption_unit { 'kwh' }

    trait :manual do
      utility_data_provider_name { 'manual' }
    end
  end
end



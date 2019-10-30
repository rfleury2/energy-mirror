FactoryBot.define do
  factory :utility_account do
    utility_name { 'ConEd' }
    resource_type { 'electricity' }
    customer_email { Faker::Internet.email }
    utility_data_provider_name { 'utility_api' }
    utility_data_provider_id { '12345' }
  end

  trait :manual do
    utility_data_provider_name { 'manual' }
  end
end

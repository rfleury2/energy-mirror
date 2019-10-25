FactoryBot.define do
  factory :utility_account do
    utility_name { 'ConEd' }
    resource_type { 'Electricity' }
    customer_email { Faker::Internet.email }
  end
end

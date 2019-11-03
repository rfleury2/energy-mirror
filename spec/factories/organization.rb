FactoryBot.define do
  factory :organization do
    display_name { Faker::Company.name }
  end
end
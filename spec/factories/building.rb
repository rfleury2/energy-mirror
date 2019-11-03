FactoryBot.define do
  factory :building do
    organization { build(:organization) }
    display_name { "#{Faker::Book.publisher} Building" }
    primary_property_type { 'Office' }
    gross_square_feet { 50000 }
    address_line_1 { Faker::Address.street_address }
    address_line_2 { nil }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code }
  end
end
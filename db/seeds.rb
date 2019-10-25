Building.find_or_create_by!(
  display_name: 'The Banespa Building',
  primary_property_type: 'Office',
  gross_square_feet: 122000,
  address_line_1: '433 Baroness St.',
  city: 'Chicago',
  state: 'IL',
  zip_code: 60647
)

UtilityAccount.find_or_create_by!(
  customer_email: 'kwexler@hamlinmcgillre.com',
  utility_name: 'ConEd',
  resource_type: 'electricity'
)

UtilityAccount.find_or_create_by!(
  customer_email: 'kwexler@hamlinmcgillre.com',
  utility_name: 'National Grid',
  resource_type: 'natural_gas'
)
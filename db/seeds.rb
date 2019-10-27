baronesa_building = Building.find_or_create_by!(
  display_name: 'The Banespa Building',
  primary_property_type: 'Office',
  gross_square_feet: 122000,
  address_line_1: '433 Baroness St.',
  city: 'Chicago',
  state: 'IL',
  zip_code: 60647
)

electricity_account = UtilityAccount.find_or_create_by!(
  customer_email: 'kwexler@hamlinmcgillre.com',
  utility_name: 'ConEd',
  resource_type: 'electricity'
)

gas_account = UtilityAccount.find_or_create_by!(
  customer_email: 'kwexler@hamlinmcgillre.com',
  utility_name: 'National Grid',
  resource_type: 'natural_gas'
)

UtilityMeter.find_or_create_by!(
  utility_account: electricity_account,
  status: 'active',
  meter_number: '01231-001',
  service_address: '433 Baroness St., Chicago, IL 60647',
  building: baronesa_building
)

UtilityMeter.find_or_create_by!(
  utility_account: electricity_account,
  status: 'active',
  meter_number: '57392-001',
  service_address: '433 Baroness St., Chicago, IL 60647',
  building: baronesa_building
)

UtilityMeter.find_or_create_by!(
  utility_account: electricity_account,
  status: 'active',
  meter_number: '36782-002',
  service_address: '601 Brigadier Louis Anthony Ave., White Plains, NY 10601'
)

UtilityMeter.find_or_create_by!(
  utility_account: gas_account,
  status: 'active',
  meter_number: 'A301-1-899976',
  service_address: '601 Brigadier Louis Anthony Ave., White Plains, NY 10601'
)

UtilityMeter.find_or_create_by!(
  utility_account: gas_account,
  status: 'active',
  meter_number: 'A301-5-122456',
  service_address: '433 Baroness St., Chicago, IL 60647',
  building: baronesa_building
)
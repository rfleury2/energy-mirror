def generate_dummy_bills_for(meter)
  consumption_unit = meter.utility_account.resource_type == 'electricity' ? 'kwh' : 'therms'

  13.times do |months_ago|
    two_months_ago = Date.today - (months_ago + 2).months
    if consumption_unit == 'kwh'
      total_cost = 1000 + Random.rand() * 400
    elsif (two_months_ago).month < 4 || (two_months_ago).month > 10
      total_cost = 300 + Random.rand() * 200
    else
      total_cost = Random.rand() * 50
    end

    UtilityBill.create!(
      utility_meter: meter,
      utility_data_provider_name: meter.utility_data_provider_name,
      utility_data_provider_id: '123',
      end_date: two_months_ago,
      start_date: two_months_ago + 1.months,
      statement_date: two_months_ago + 45.days,
      total_cost: total_cost,
      total_volume: consumption_unit == 'kwh' ? total_cost * 9.0 : total_cost * 1.5,
      consumption_unit: consumption_unit
    )
  end

end

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
  customer_email: 'slawrence@rivierarealestate.com',
  utility_name: 'ConEd',
  resource_type: 'electricity'
)

gas_account = UtilityAccount.find_or_create_by!(
  customer_email: 'slawrence@rivierarealestate.com',
  utility_name: 'National Grid',
  resource_type: 'natural_gas'
)

meter = UtilityMeter.find_or_create_by!(
  utility_account: electricity_account,
  status: 'active',
  utility_data_provider_name: 'manual',
  meter_number: '57392-001',
  service_address: '433 Baroness St., Chicago, IL 60647',
  building: baronesa_building
)
generate_dummy_bills_for(meter)

meter = UtilityMeter.find_or_create_by!(
  utility_account: electricity_account,
  status: 'active',
  utility_data_provider_name: 'manual',
  meter_number: '36782-002',
  service_address: '601 Brigadier Louis Anthony Ave., White Plains, NY 10601'
)
generate_dummy_bills_for(meter)

meter = UtilityMeter.find_or_create_by!(
  utility_account: gas_account,
  status: 'active',
  utility_data_provider_name: 'manual',
  meter_number: 'A301-1-899976',
  service_address: '601 Brigadier Louis Anthony Ave., White Plains, NY 10601'
)
generate_dummy_bills_for(meter)

meter = UtilityMeter.find_or_create_by!(
  utility_account: gas_account,
  status: 'active',
  utility_data_provider_name: 'manual',
  meter_number: 'A301-5-122456',
  service_address: '433 Baroness St., Chicago, IL 60647',
  building: baronesa_building
)
generate_dummy_bills_for(meter)







school_building = Building.find_or_create_by!(
  display_name: 'McKinley High School',
  primary_property_type: 'K-12 School',
  gross_square_feet: 42000,
  address_line_1: '8724 Route 34',
  city: 'Santa Barbara',
  state: 'CA',
  zip_code: 93105
)

pge_electricity_account = UtilityAccount.find_or_create_by!(
  customer_email: 'slawrence@rivierarealestate.com',
  utility_name: 'PG&E',
  resource_type: 'electricity'
)

pge_gas_account = UtilityAccount.find_or_create_by!(
  customer_email: 'slawrence@rivierarealestate.com',
  utility_name: 'PG&E',
  resource_type: 'natural_gas'
)

meter = UtilityMeter.find_or_create_by!(
  utility_account: pge_electricity_account,
  status: 'active',
  utility_data_provider_name: 'manual',
  meter_number: '01231-001',
  service_address: '8724 Route 34',
  building: school_building
)
generate_dummy_bills_for(meter)

meter = UtilityMeter.find_or_create_by!(
  utility_account: pge_electricity_account,
  status: 'active',
  utility_data_provider_name: 'manual',
  meter_number: '57392-001',
  service_address: '8724 Rt 34',
  building: school_building
)
generate_dummy_bills_for(meter)

meter = UtilityMeter.find_or_create_by!(
  utility_account: pge_gas_account,
  status: 'active',
  utility_data_provider_name: 'manual',
  meter_number: 'A301-5-122456',
  service_address: '8724 Rt 34',
  building: school_building
)
generate_dummy_bills_for(meter)



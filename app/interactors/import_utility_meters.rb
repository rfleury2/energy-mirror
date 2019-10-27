class ImportUtilityMeters
  include Interactor

  def call
    utility_account = context.utility_account
    authorization_id = utility_account.utility_data_provider_id

    UtilityApi::Client.new.get_meters(authorization_id).each do |meter_hash|
      utility_meter = utility_account.utility_meters.find_or_initialize_by(
        utility_data_provider_id: meter_hash[:utility_data_provider_id],
        utility_data_provider_name: meter_hash[:utility_data_provider_name]
      )

      utility_meter.update(
        meter_number: meter_hash[:meter_number],
        service_address: meter_hash[:service_address],
        status: meter_hash[:status]
      )
    end
  end
end
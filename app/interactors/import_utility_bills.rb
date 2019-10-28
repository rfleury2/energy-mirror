class ImportUtilityBills
  include Interactor

  def call
    utility_meter = context.utility_meter
    meter_uid = utility_meter.utility_data_provider_id

    UtilityApi::Client.new.get_bills(meter_uid).each do |bill_hash|
      utility_bill = utility_meter.utility_bills.find_or_initialize_by(
        utility_data_provider_id: bill_hash[:utility_data_provider_id],
        utility_data_provider_name: bill_hash[:utility_data_provider_name]
      )

      utility_bill.update(
        end_date: bill_hash[:end_date],
        start_date: bill_hash[:start_date],
        statement_date: bill_hash[:statement_date],
        total_cost: bill_hash[:total_cost],
        consumption_unit: bill_hash[:total_unit],
        total_volume: bill_hash[:total_volume]
      )
    end
  end
end
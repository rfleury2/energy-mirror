class UtilityBill < ApplicationRecord
  belongs_to :utility_meter

  validates_presence_of :utility_data_provider_id,
                        :utility_data_provider_name,
                        :end_date,
                        :start_date,
                        :statement_date,
                        :total_cost,
                        :total_volume,
                        :consumption_unit

  validates_numericality_of :total_cost,
                            :total_volume

  VALID_CONSUMPTION_UNITS = %w(
    kwh
    therms
  )
  VALID_PROVIDER_NAMES = %w(
    utility_api
    manual
  )

  validates_inclusion_of :utility_data_provider_name, in: VALID_PROVIDER_NAMES
  validates_inclusion_of :consumption_unit, in: VALID_CONSUMPTION_UNITS

  scope :electric, -> { where(consumption_unit: 'kwh') }
  scope :natural_gas, -> { where(consumption_unit: 'therms') }

  def display_service_dates
    "#{start_date.strftime('%m/%d/%y')} - #{end_date.strftime('%m/%d/%y')}"
  end

  def display_utility_information
    "#{utility_meter.display_resource_type} - #{utility_meter.utility_name}"
  end

  def cost_per_unit
    total_cost / total_volume
  end
end

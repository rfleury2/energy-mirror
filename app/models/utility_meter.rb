class UtilityMeter < ApplicationRecord
  belongs_to :utility_account
  belongs_to :building, required: false

  VALID_PROVIDER_NAMES = %w(utility_api)

  validates_inclusion_of :utility_data_provider_name, in: VALID_PROVIDER_NAMES
  validates_presence_of :status,
                        :meter_number,
                        :service_address
end

class UtilityMeter < ApplicationRecord
  belongs_to :utility_account
  belongs_to :building, required: false
  has_many :utility_bills

  VALID_PROVIDER_NAMES = %w(
    utility_api
    manual
  )

  validates_inclusion_of :utility_data_provider_name, in: VALID_PROVIDER_NAMES
  validates_presence_of :status,
                        :meter_number,
                        :service_address

  delegate :utility_name, :display_resource_type, to: :utility_account

  def active?
    status == 'active'
  end
end

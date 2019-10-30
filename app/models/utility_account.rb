class UtilityAccount < ApplicationRecord
  has_many :utility_meters

  VALID_RESOURCE_TYPES = %w(
    electricity
    natural_gas
  )
  VALID_PROVIDER_NAMES = %w(
    utility_api
    manual
  )

  validates_presence_of :customer_email,
                        :utility_name,
                        :resource_type

  validates_inclusion_of :resource_type, in: VALID_RESOURCE_TYPES
  validates_inclusion_of :utility_data_provider_name, in: VALID_PROVIDER_NAMES

  def display_resource_type
    case resource_type
    when 'electricity'
      'Electricity'
    when 'natural_gas'
      'Natural Gas'
    else
      'N/A'
    end
  end
end

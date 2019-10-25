class UtilityAccount < ApplicationRecord
  VALID_RESOURCE_TYPES = %w(
    electricity
    natural_gas
  )

  validates_presence_of :customer_email,
                        :utility_name,
                        :resource_type

  validates_inclusion_of :resource_type, in: VALID_RESOURCE_TYPES

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

class UtilityAccount < ApplicationRecord
  VALID_RESOURCE_TYPES = %w(
    Electricity
    Natural Gas
  )

  validates_presence_of :customer_email,
                        :utility_name,
                        :resource_type

  validates_inclusion_of :resource_type, in: VALID_RESOURCE_TYPES
end

class Building < ApplicationRecord
  has_many :utility_meters

  VALID_PROPERTY_TYPES = %w(
    Bank Branch
    Courthouse
    Dormitory/Residence Hall
    Financial Office
    Data Center
    K-12 School
    Hospital
    Hotel
    Medical Office
    Multifamily Housing
    Office
    Other
    Retail Store
    Senior Care Community
    Supermarket/Grocery Store
    Warehouse/Distribution Center
    Worship Facility
  )

  validates_presence_of :display_name,
                        :primary_property_type,
                        :gross_square_feet,
                        :address_line_1,
                        :city,
                        :state,
                        :zip_code

  validates_numericality_of :gross_square_feet
  validates_inclusion_of :primary_property_type, in: VALID_PROPERTY_TYPES
end

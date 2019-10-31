class Building < ApplicationRecord
  has_many :utility_meters

  STATE_ABBREVIATIONS = ['AL', 'AK', 'AS', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FM', 'FL', 'GA', 'GU', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MH', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'MP', 'OH', 'OK', 'OR', 'PW', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VI', 'VA', 'WA', 'WV', 'WI', 'WY' ]

  VALID_PROPERTY_TYPES = [
    'Bank Branch',
    'Courthouse',
    'Dormitory/Residence Hall',
    'Financial Office',
    'Data Center',
    'K-12 School',
    'Hospital',
    'Hotel',
    'Medical Office',
    'Multifamily Housing',
    'Office',
    'Other',
    'Retail Store',
    'Senior Care Community',
    'Supermarket/Grocery Store',
    'Warehouse/Distribution Center',
    'Worship Facility'
  ]

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

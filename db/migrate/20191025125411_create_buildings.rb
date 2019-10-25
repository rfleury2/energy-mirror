class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :display_name
      t.string :primary_property_type
      t.string :gross_square_feet

      # TODO: Extract Address to its own object
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip_code

      t.json :energy_star_attributes, default: {}

      t.timestamps
    end
  end
end

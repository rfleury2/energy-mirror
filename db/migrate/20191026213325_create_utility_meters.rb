class CreateUtilityMeters < ActiveRecord::Migration[6.0]
  def change
    create_table :utility_meters do |t|
      t.belongs_to :utility_account
      t.belongs_to :building
      t.string :utility_data_provider_name, default: 'utility_api'
      t.string :utility_data_provider_id
      t.string :status
      t.string :meter_number
      t.string :service_address

      t.timestamps
    end
  end
end

class CreateUtilityBills < ActiveRecord::Migration[6.0]
  def change
    create_table :utility_bills do |t|
      t.string :utility_data_provider_id
      t.string :utility_data_provider_name
      t.belongs_to :utility_meter

      t.date :end_date
      t.date :start_date
      t.date :statement_date

      t.decimal :total_cost
      t.decimal :total_volume
      t.string :consumption_unit

      t.timestamps
    end
  end
end

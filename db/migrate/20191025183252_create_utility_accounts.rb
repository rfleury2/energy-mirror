class CreateUtilityAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :utility_accounts do |t|
      t.string :utility_name
      t.string :resource_type
      t.string :customer_email

      t.timestamps
    end
  end
end

class AddUtilityProviderInformationToUtilityAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :utility_accounts, :utility_data_provider_name, :string, default: 'utility_api'
    add_column :utility_accounts, :utility_data_provider_id, :string
  end
end

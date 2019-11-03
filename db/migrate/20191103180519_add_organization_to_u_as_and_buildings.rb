class AddOrganizationToUAsAndBuildings < ActiveRecord::Migration[6.0]
  def change
    add_column :utility_accounts, :organization_id, :integer
    add_column :buildings, :organization_id, :integer
  end
end

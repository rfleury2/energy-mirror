class AddOrganizationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :organization_id, :integer
    add_column :users, :display_name, :string
  end
end

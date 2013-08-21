class AddFederationToDeal < ActiveRecord::Migration
  def change
    add_column :deals, :federation_id, :integer
    add_column :deals, :cached_federation_name, :string
  end
end

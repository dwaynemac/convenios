class ResponsibleAccount < ActiveRecord::Migration
  def change
    add_column :deals, :responsible_account, :string
  end
end

class AddBusinessDescription < ActiveRecord::Migration
  def change
    add_column :businesses, :description, :text
  end
end

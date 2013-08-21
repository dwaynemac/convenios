class RemoveDates < ActiveRecord::Migration
  def change
    remove_columns :deals, :ends_on, :began_on
  end
end

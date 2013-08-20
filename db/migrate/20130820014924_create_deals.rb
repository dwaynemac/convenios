class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.text   :description

      t.string :responsible_user

      t.references :business

      t.date :began_on
      t.date :ends_on

      t.timestamps
    end
  end
end

class AddCategoryToDeals < ActiveRecord::Migration
  def change
    add_reference :deals, :category, index: true
  end
end

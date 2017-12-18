class RemovepricefromstoreBike < ActiveRecord::Migration
  def change
    remove_column :store_bikes, :price
  end
end

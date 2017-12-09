class AddPriceToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :price, :decimal 
  end
end

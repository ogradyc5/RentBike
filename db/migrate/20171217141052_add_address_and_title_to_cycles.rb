class AddAddressAndTitleToCycles < ActiveRecord::Migration
  def change
     add_column :cycles, :address, :string
     add_column :cycles, :title, :string
  end
end

class CreateRentBikes < ActiveRecord::Migration
  def change
    create_table :rent_bikes do |t|
      t.string :name
    end
  end
end

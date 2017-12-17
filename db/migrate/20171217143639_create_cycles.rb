class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps null: false
    end
  end
end

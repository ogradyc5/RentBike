class CreateStoreBikes < ActiveRecord::Migration
  def change
    create_table :store_bikes do |t|
      t.references :store, index: true, foreign_key: true
      t.references :bike, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

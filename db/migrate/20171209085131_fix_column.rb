class FixColumn < ActiveRecord::Migration
  def change
    rename_column :bookings, :resource_id, :store_bike_id
  end
end

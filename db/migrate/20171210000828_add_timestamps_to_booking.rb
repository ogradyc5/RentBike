class AddTimestampsToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :created_at, :datetime
    add_column :bookings, :updated_at, :datetime
  end
end

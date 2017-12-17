class DropCycles < ActiveRecord::Migration
  def change
    drop_table :cycles
  end
end

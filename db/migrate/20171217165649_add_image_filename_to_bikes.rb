class AddImageFilenameToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :image_filename, :string
  end
end

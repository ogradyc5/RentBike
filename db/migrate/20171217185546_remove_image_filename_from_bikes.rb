class RemoveImageFilenameFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :image_filename
  end
end

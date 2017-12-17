class RemoveThumbnailFileNameFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :thumbnail_file_name
  end
end

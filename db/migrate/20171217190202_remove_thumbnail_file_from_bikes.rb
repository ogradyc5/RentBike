class RemoveThumbnailFileFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :thumbnail_content_type
    remove_column :bikes, :thumbnail_file_size
    remove_column :bikes, :thumbnail_updated_at
  end
end

class AddAttachmentThumbnailToBikes < ActiveRecord::Migration
  def self.up
    change_table :bikes do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :bikes, :thumbnail
  end
end

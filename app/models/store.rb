class Store < ActiveRecord::Base
    
    has_many :bikes, :through => :store_bikes
    has_many :store_bikes, :dependent => :destroy
    mount_uploader :image, ImageUploader
end

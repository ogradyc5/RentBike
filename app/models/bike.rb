class Bike < ActiveRecord::Base
    
    validates :name, presence: true, uniqueness: true  
    #has_many :stores, :through => :store_bikes  
    has_many :stores, :through => :store_bikes  
    has_many :bikes, :through => :store_bikes  
    has_many :store_bikes, :dependent => :destroy
    has_many :bookings, through: :store_bikes
    acts_as_votable
    mount_uploader :image, ImageUploader
  
  
    def self.search(search)  
        where("lower(stores.name) LIKE :search OR lower(bikes.name) LIKE :search", search: "%#{search.downcase}%").uniq   
    end
end

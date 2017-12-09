class Bike < ActiveRecord::Base
    
    validates :name, presence: true, uniqueness: true  
    has_many :stores, :through => :store_bikes  
    #belongs_to :store
    has_many :store_bikes, :dependent => :destroy
    
    def self.search(search)  
        where("lower(stores.name) LIKE :search OR lower(bikes.name) LIKE :search", search: "%#{search.downcase}%").uniq   
    end
end

class Bike < ActiveRecord::Base
    
    validates :name, presence: true, uniqueness: true  
    has_many :stores, :through => :store_bikes  
    has_many :store_bikrs, :dependent => :destroy
end

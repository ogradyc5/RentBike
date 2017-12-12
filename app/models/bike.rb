class Bike < ActiveRecord::Base
    
    validates :name, presence: true, uniqueness: true  
    has_many :stores, :through => :store_bikes  
    has_many :store_bikes, :dependent => :destroy
    
    def self.search(search)  
        where("lower(stores.name) LIKE :search OR lower(bikes.name) LIKE :search", search: "%#{search.downcase}%").uniq   
    end
    

    def total_income
        total = 0
        store_bike.each { |r| total += r.sum_price }
        total
    end
end

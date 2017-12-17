class Bike < ActiveRecord::Base
    
    validates :name, presence: true, uniqueness: true  
    has_many :stores, :through => :store_bikes  
    has_many :store_bikes, :dependent => :destroy
    
    mount_uploader :image, ImageUploader
  
  
    def self.search(search)  
        where("lower(stores.name) LIKE :search OR lower(bikes.name) LIKE :search", search: "%#{search.downcase}%").uniq   
    end
    
    
   # def self.new_from_lookup(search) 
    #    begin
     #     #looked_up_bike = where("lower(bikes.name) LIKE :search", search: "%#{search.downcase}%").uniq
      #    looked_up_bike = Bike.find_by(:name => search)
       #   new(name: looked_up_bike.name, price: looked_up_bike.price)
       # rescue Exception => e
        #    return nil
    #    end
    #end

    def total_income
        total = 0
        store_bike.each { |r| total += r.sum_price }
        total
    end
end

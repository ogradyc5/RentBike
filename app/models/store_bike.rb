class StoreBike < ActiveRecord::Base
  #validates :name, presence: true, uniqueness: true
  validates_uniqueness_of :bike_id, :scope => [:store_id]  
  belongs_to :store  
  belongs_to :bike
  has_many :bookings
  has_many :users, through: :bookings
  
  def self.find_by_store_bike_id(store_bike_id)
      where(id: store_bike_id).first
  end

  
  def self.new_from_lookup(search) 
    begin
      #looked_up_storebike = where("storebikes.id LIKE :search", search: "%#{search}%").uniq
      looked_up_storebike = StoreBike.find_by(:id => search)
      #new(name: looked_up_storebike.bike.name) #bike: looked_up_storebike.bike.bike_id)
    rescue Exception => e
      return nil
    end
  end
  

  def self.strip_commas(number)
    number.gsub(",", "")
  end
 
  
end

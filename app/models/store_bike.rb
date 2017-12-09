class StoreBike < ActiveRecord::Base
  #validates :name, presence: true, uniqueness: true
  validates_uniqueness_of :bike_id, :scope => [:store_id]  
  belongs_to :store  
  belongs_to :bike
  has_many :bookings
  
  def sum_price
    @booking.length * bike.price
  end
 
end

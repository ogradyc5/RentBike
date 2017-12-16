require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
  belongs_to :user
  
  def sum_price
    @sum_price = length * store_bike.bike.price
  end
  

  def require_same_user
    if current_user != @booking.user and !current_user.admin?
    flash[:danger] = "You can only edit or delete your own bikes"
    redirect_to root_path
    end
  end

end
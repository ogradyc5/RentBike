class UsersController < ApplicationController
 
    
    def index
        @bookings = Booking.all
    end
    
    def my_profile 
        @user = current_user
        @bookings = current_user.bookings
    end 
    
    def show
     #   @user = User.find(params[:id])
     #   @user = current_user
        redirect_to :action => :my_profile
    end
    
    
  
end 
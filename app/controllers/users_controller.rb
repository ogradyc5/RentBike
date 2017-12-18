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
    
    def my_friends
        @friendships = current_user.friends
    end
    
    def search
        if params[:search_param].blank?
            flash.now[:danger]="You have entered an empty search"
        else
            @users = User.search(params[:search_param])
            flash.now[:danger] = "No users match this search criteria" if @users.blank?
        end 
        render partial: 'friends/result'    
        end 
    
end 
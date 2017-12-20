class UsersController < ApplicationController
 
    
    def index
        @bookings = Booking.all
    end
    
    def my_profile 
        @user = current_user
        @bookings = current_user.bookings
    end 
    
    def show
        @user = User.find(params[:id])
     #   @user = current_user
       # redirect_to :action => :my_profile
       @bookings = @user.bookings
    end
    
    def add_friend
        @friend = User.find(params[:friend])
        current_user.friendships.build(friend_id: @friend.id)
        
        if current_user.save
            flash[:success] = "Friend was successfully added"
        else
            flash[:danger] = "There was something wrong with the friend request"
        end
        redirect_to my_friends_path
    end 
    
    def my_friends
        @friendships = current_user.friends
    end
    
    
    
    def search
        if params[:search_param].blank?
            flash.now[:danger]="You have entered an empty search"
        else
            @users = User.search(params[:search_param])
            @users = current_user.except_current_user(@users)
            flash.now[:danger] = "No users match this search criteria" if @users.blank?
        end 
        render partial: 'friends/result'    
        end 
    
end 
class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  #before_action :authenticate_user!, :except => [:show, :index]
  before_action :find_store 
  before_action :find_store_bike
  
 
  def index
    @bookings = Booking.where("store_bike_id = ? AND end_time >= ?", @store_bike.id, Time.now).order(:start_time)
    respond_with @bookings
    #@bookings = Booking.all
  end

  def new
    @booking = Booking.new(id: @store_bike)
   # @booking = Booking.new(StoreBike.find(params[:store_bike]))
   # @booking = @store_bike.bookings.build
  end

  def create
    #@booking =  Booking.new(params[:booking].permit(:store_bike, :start_time, :length))
    @booking = Booking.new(params[:booking].permit(:store_bike_id, :start_time, :length).merge(user_id: current_user.id))
   # @booking.user = User.first
    @booking.store_bike = @store_bike 
    #@booking.store_bike = StoreBike.find(params[:store_bike]).first
   # @booking.id = @store_bike
    if @booking.save
      @booking.create_activity :create, owner: current_user
      flash[:success] = "Booking was successfully created"
      #redirect_to store_store_bike_bookings_path(@store, @store_bike, method: :get)
      #redirect_to store_store_bike_bookings_show_path
      redirect_to my_profile_path
    else
      render 'new'
    end
  end
 

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      @booking.create_activity :destroy, owner: current_user
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
     # redirect_to store_store_bike_bookings_path(@store, @store_bike)
     redirect_to my_profile_path
    else
      render 'index'
    end
  end
  
  # def destroy
   #     booking = Booking.find(params[:id])
    #    @user_booking = UserBooking.where(user_id: current_user.id, booking_id: booking.id).first
     #   @user_booking.destroy
      #  flash[:notice] = "Booking was successfully removed from profile"
       # redirect_to my_profile_path
  #  end 

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.store_bikes = @store_bikes

   # if @booking.update(params[:booking].permit(:id, :start_time, :length))
   if @booking.update(params[:booking].permit(:store_bike_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        @booking.create_activity :update, owner: current_user
        render json: {status: :success}.to_json
      else
        redirect_to store_store_bike_bookings_path(@store, @store_bike)
      end
    else
      render 'edit'
    end
  end

private
  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to store_store_bike_booking_path(@store, @store_bike, @booking)
      else
        render 'new'
      end
  end

  def find_store_bike
    if params[:store_bike_id]
      #@store_bike = StoreBike.find_by_id(params[:store_bike_id])
      @store_bike = StoreBike.find(params[:store_bike_id])
    end
  end

  def find_store  
    if params[:store_id]  
      @store = Store.find_by_id(params[:store_id])  
    end
end

 
end

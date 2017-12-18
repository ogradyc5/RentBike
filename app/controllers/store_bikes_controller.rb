class StoreBikesController < ApplicationController
  #before_action :authenticate_user!, :except => [:show, :index]
  before_action :find_store 
  before_action :set_store_bike, only: [:create, :show, :edit, :update, :destroy]
  


  def index  
    if @store.nil?  
      @store_bikes = StoreBike.all  
    else
      @store_bikes = StoreBike.where("store_id = ?", @store)  
    end  
  end  
  
  def find_store  
    if params[:store_id]  
      @store = Store.find_by_id(params[:store_id])  
    end  
  end


  def search
    if params[:storebike].blank?
        flash.now[:danger] = "You have entered an empty search"
    else
        @storebike = StoreBike.new_from_lookup(params[:storebike])
        flash.now[:danger] = "You have entered an invalid search" unless
      @storebike
    end
    render partial: 'users/result'
  end

  def new
    @store_bike = StoreBike.new
  end

  def create
    #@store_bike = StoreBike.create(store_bike_params)
   # @store_bike = StoreBike.new(params[:store_bike])
    @store_bike = StoreBike.create(store_bike_params)
    if @store_bike.save
      redirect_to store_bikes_path
      flash[:notice] ='successfully created'
    else
      render 'new'
      flash[:error] = "Unable to create store bike. Please try again"
    end
  end

  def destroy
    @store_bike = StoreBike.find(params[:id])
    @store_bike.destroy
    redirect_to store_bikes_path
  end

  def edit
    @store_bike = StoreBike.find(params[:id])
  end

  def update
    @store_bike = StoreBike.find(params[:id])
    @store_bike.update store_bike_params
    if @store_bike.save
      flash[:notice] = "Your store bike was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def store_bike_params
      params.require(:store_bike).permit(:name, :delete)
    end
    
    def store_bike_params  
      params.require(:store_bike).permit(:bike_id, :store_id)  
    end
    
   
end

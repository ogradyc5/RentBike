class SessionsController < ApplicationController
    before_action :authenticate_user!, :except => [:show, :index]
    def create 
        
        
    end 
    
    def destroy 
        
        
    end 
end
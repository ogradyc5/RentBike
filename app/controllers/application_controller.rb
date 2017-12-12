class ApplicationController < ActionController::Base
  respond_to :html, :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  helper_method :current_user  
  #def current_user  
   # return unless session[:user_id]  
    #@current_user ||= User.find(session[:user_id])  
    
  #end  
  
end

class ApplicationController < ActionController::Base
  respond_to :html, :json

  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  helper_method :current_user  

  
end

class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  respond_to :html, :json

  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  helper_method :current_user  
  

  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end 
  


  hide_action :current_user
  
end

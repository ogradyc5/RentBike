class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    if user_signed_in?
      redirect_to my_profile_path
    end 
  end
  
end

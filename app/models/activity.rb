class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  #attr_accessible :action, :trackable
  
  
  private
 def params_activity
    params.require(:activity).permit(:action, :trackable)
  end
end

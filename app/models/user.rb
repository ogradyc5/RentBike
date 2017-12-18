class User < ActiveRecord::Base

  has_many :bookings, dependent: :destroy
  has_many :store_bikes, through: :bookings
  has_many :friendships
  has_many :friends, through: :friendships
  acts_as_voter
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }
 # validates :username, presence: true,
 # uniqueness: { case_sensitive: false },
  #length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
  uniqueness: { case_sensitive: false },
  format: { with: VALID_EMAIL_REGEX }
  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end 
  
  def under_store_bike_limit?
    (bookings.count < 2)
  end
  
  def can_add_store_bike?(id)
    under_store_bike_limit? && !store_bike_already_added?(id)
  end
  

end
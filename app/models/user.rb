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
  
  
  def self.search(param)
    param.strip!
    param.downcase!
    to_send_back = (first_name_matches(param)+last_name_matches(param)+email_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end 
  
  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.matches(field_name, param)
    User.where("#{field_name} like ?", "%#{param}%")
  end

end
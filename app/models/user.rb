class User < ActiveRecord::Base
  
  ROLES = %w[admin user]
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

  has_many :tour_sign_ups, inverse_of: :user, dependent: :destroy
  has_many :tours, through: :tour_sign_ups, inverse_of: :travelers
  
  has_many :investor_groupings
  has_many :groups, through: :investor_groupings
  
  has_many :loans, foreign_key: :investor_id, inverse_of: :lender, dependent: :destroy
  has_many :debitors, through: :loans, source: :entrepreneur
  
  
  after_create :send_welcome_email
  
  def full_name
    first_name + " " + last_name
  end
  
  def backed_projects
    Project.joins(:loans).where("loans.lender_id = ?", id).group('projects.id')
  end
  
  private
    
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
  
end
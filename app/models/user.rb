class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


  has_many :tour_sign_ups, inverse_of: :user, dependent: :destroy
  has_many :tours, through: :tour_sign_ups, inverse_of: :travelers
  
  has_many :investor_groupings
  has_many :groups, through: :investor_groupings
  
  has_many :loans, foreign_key: :investor_id
  has_many :debitors, through: :loans, source: :entrepreneur
end
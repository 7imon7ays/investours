class Entrepreneur < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :location
  
  validates :first_name, :last_name, presence: true
  
  has_many :tour_meetings, inverse_of: :entrepreneur
  has_many :tours, through: :tour_meetings, inverse_of: :entrepreneurs
end
class Entrepreneur < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :location, :tour_ids
  
  validates :first_name, :last_name, presence: true
  
  has_many :tour_meetings, inverse_of: :entrepreneur, dependent: :destroy
  has_many :tours, through: :tour_meetings, inverse_of: :entrepreneurs
  
  has_many :loans, dependent: :destroy
  has_many :creditors, through: :loans, source: :investor
  
  def full_name
    first_name + " " + last_name
  end
  
end
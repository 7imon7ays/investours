class Tour < ActiveRecord::Base
  attr_accessible :location, :start_date, :end_date
  
  has_many :tour_sign_ups, inverse_of: :tour, dependent: :destroy
  has_many :travelers, through: :tour_sign_ups, source: :user, inverse_of: :tours
end

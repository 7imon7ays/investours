class TourMeeting < ActiveRecord::Base
  attr_accessible :entrepreneur, :tour
  
  validates :entrepreneur, :tour, presence: true
  validates :entrepreneur, :uniqueness => {:scope => :tour_id}
  
  belongs_to :entrepreneur, inverse_of: :tour_meetings
  belongs_to :tour, inverse_of: :tour_meetings
end

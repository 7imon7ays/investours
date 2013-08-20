class TourMeeting < ActiveRecord::Base
  attr_accessible :entrepreneur_id, :tour_id
  
  validates :entrepreneur_id, :tour_id, presence: true
  validates :entrepreneur_id, :uniqueness => {:scope => :tour_id}
  
  belongs_to :entrepreneur, inverse_of: :tour_meetings
  belongs_to :tour, inverse_of: :tour_meetings
end

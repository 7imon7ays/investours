class TourSignUp < ActiveRecord::Base
  attr_accessible :user, :tour
  
  validates :user, :tour, presence: true
  validates :user, :uniqueness => {:scope => :tour_id}
  
  belongs_to :user
  belongs_to :tour
end

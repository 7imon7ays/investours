class TourSignUp < ActiveRecord::Base
  attr_accessible :user_id, :tour_id
  
  validates :user_id, :tour_id, presence: true
  validates :user_id, uniqueness: { scope: :tour_id, message: "can't sign up twice!" }
  
  belongs_to :user
  belongs_to :tour
end

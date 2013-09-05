class Tour < ActiveRecord::Base
  attr_accessible :location, :date
  
  has_many :tour_sign_ups, inverse_of: :tour, dependent: :destroy
  has_many :travelers, through: :tour_sign_ups, source: :user, inverse_of: :tours
  
  has_many :tour_meetings, inverse_of: :tour, dependent: :destroy
  has_many :entrepreneurs, through: :tour_meetings, inverse_of: :tours
  
  def as_json(options = {})
    super(options.merge({ include: :entrepreneurs }))
  end
  
end

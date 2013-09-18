class Project < ActiveRecord::Base
  attr_accessible :title, :description, :entrepreneur_id, :fundraising_goal, :fundraising_status
  
  belongs_to :entrepreneur
end

class Project < ActiveRecord::Base
  attr_accessible :title, :description, :entrepreneur_id, :fundraising_goal, :amount_raised
  
  belongs_to :entrepreneur
  has_many :loans
  
  def backers
    User.joins(:loans).where("loans.project_id = ?", id).group('users.id')
  end
  
  def fundraising_status
    amount_raised / fundraising_goal * 100
  end
    
end

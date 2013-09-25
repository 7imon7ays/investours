class Project < ActiveRecord::Base
  attr_accessible :title, :description, :entrepreneur_id, :fundraising_goal
  
  belongs_to :entrepreneur
  has_many :loans
  has_many :backers, through: :loans, source: :lender, uniq: true
  has_many :updates
    
  def amount_raised
    loans.pluck("principal").inject(:+)
  end
    
  def progress_status
    amount_raised / fundraising_goal * 100
  end
  
  def fully_funded?
    amount_raised >= fundraising_goal
  end
    
end

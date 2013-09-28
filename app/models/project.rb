class Project < ActiveRecord::Base
  attr_accessible :title, :description, :entrepreneur_id, :fundraising_goal
  
  belongs_to :entrepreneur
  has_many :loans
  has_many :backers, through: :loans, source: :lender, uniq: true
  has_many :updates
    
  def amount_raised
    loans.map { |loan| loan.principal }.inject(:+) || 0
  end
    
  def progress_status
    amount_raised / fundraising_goal * 100
  end
  
  def fully_funded?
    amount_raised >= fundraising_goal
  end
  
  def borrowed_amount
    loans.includes.map { |loan| loan.amount_owed }.inject(:+)
  end
  
  def repaid_amount
    Loan.includes(:payments).where(project_id: id).map { |loan| loan.amount_paid }.inject(:+)
  end
  
  def repayment_status
    repaid_amount / borrowed_amount * 100
  end
    
end

class Loan < ActiveRecord::Base
  attr_accessible :entrepreneur_id, :investor_id, :project_id, :progress
  
  validates :entrepreneur_id, :investor_id, presence: true
  
  belongs_to :entrepreneur
  belongs_to :investor
  has_many :repayments
  
  def amount_owed
    principal + principal * interest
  end
  
  def amount_repaid
    repayments.inject(:+)
  end
  
  def oustanding_balance
    amount_owed - amount_repaid
  end
end

class Loan < ActiveRecord::Base
  attr_accessible :entrepreneur_id, :lender_id, :project_id, :principal, :interest
  
  validates :entrepreneur_id, :lender_id, presence: true
  
  belongs_to :borrower, class_name: "Entrepreneur", foreign_key: :entrepreneur_id
  belongs_to :lender, class_name: "User", foreign_key: :lender_id, inverse_of: :loans
  belongs_to :project
  has_many :payments, dependent: :destroy
  
  def amount_owed
    principal + principal * interest
  end
  
  def amount_paid
    payments.pluck("amount").inject(:+) || 0
  end
  
  def oustanding_balance
    amount_owed - amount_paid
  end
  
  def repayment_status
    amount_paid / amount_owed * 100
  end
  
  def payed_off?
    amount_paid >= amount_owed
  end
  
end

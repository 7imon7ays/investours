class Payment < ActiveRecord::Base
  attr_accessible :loan_id, :payer_id, :amount
  
  validates :loan_id, :payer_id, :amount, presence: true
  validate :loan_cannot_be_paid_in_full, :amount_cannot_exceed_loan_amount_owed
  
  belongs_to :loan
  belongs_to :payer, class_name: "Entrepreneur", foreign_key: :payer_id
  
  private
  
  def loan_cannot_be_paid_in_full
    errors.add(:loan, "cannot be paid in full") if loan.paid_in_full?
  end
  
  def amount_cannot_exceed_loan_amount_owed
    errors.add(:amount, "cannot exceed amount owed on loan") if amount > loan.amount_owed
  end
  
end

class Payment < ActiveRecord::Base
  attr_accessible :loan_id, :payer_id, :amount
  
  belongs_to :loan
  belongs_to :payer, class_name: "Entrepreneur", foreign_key: :payer_id
end

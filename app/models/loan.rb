class Loan < ActiveRecord::Base
  attr_accessible :entrepreneur_id, :investor_id, :progress
  
  validates :entrepreneur_id, :investor_id, presence: true
  
  belongs_to :entrepreneur
  belongs_to :investor
end

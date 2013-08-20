class InvestorGrouping < ActiveRecord::Base
  attr_accessible :investor_id, :group_id
  
  validates :investor_id, :group_id, presence: true
  validates :investor_id, uniqueness: { scope: :group_id }
  
  belongs_to :investor, class_name: 'Investor'
  belongs_to :group, class_name: 'InvestorGroup'
end

class InvestorGroup < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, presence: true
  
  has_many :investor_groupings
  has_many :investors, through: :investor_groupings, source: :investor
end

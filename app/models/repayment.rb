class Repayment < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :loan
end

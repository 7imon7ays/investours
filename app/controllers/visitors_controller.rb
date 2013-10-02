class VisitorsController < ApplicationController
  
  def welcome
    @entrepreneurs = Entrepreneur.order("random()").limit(3)
  end
  
end

class VisitorsController < ApplicationController
  
  def welcome
    @entrepreneurs = Entrepreneur.all
  end
  
end

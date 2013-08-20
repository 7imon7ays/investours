class ToursController < ApplicationController
  
  def show
    @tour = Tour.find(params[:id])
  end
  
  def index
    @tours = Tour.all
  end
  
end

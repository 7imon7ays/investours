class ToursController < ApplicationController
  
  def show
    @tour = Tour.find(params[:id])
  end
  
  def index
    @tours = Tour.all
  end
  
  def new
    @tour = Tour.new
    authorize! :create, @tour
  end
  
  def create
    @tour = Tour.new(params[:tour])
        
    if @tour.save
      redirect_to tour_url(@tour)
      flash[:notice] = "New tour successfully added."
    else
      flash.now[:error] = @tour.errors.full_messages
      render action: "new"
    end
  end
  
  def edit
    @tour = Tour.find(params[:id])
  end
  
  def update
    @tour = Tour.update_attributes(params[:tour])
    
    if @tour.save
      redirect_to tour_url(@tour)
      flash[:notice] = "New tour successfully updated."
    else
      flash.now[:error] = @tour.errors.full_messages
      render action: "edit"
    end
  end
  
  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to tour_url
  end
end

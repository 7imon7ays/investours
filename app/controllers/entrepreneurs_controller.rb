class EntrepreneursController < ApplicationController
  
  def index
    @entrepreneurs = Entrepreneur.all
  end
  
  def show
    @entrepreneur = Entrepreneur.find(params[:id])
    @projects = @entrepreneur.projects
  end
  
  def new
    @entrepreneur = Entrepreneur.new
    @tours = Tour.where("date > ?", Date.current)
    
    authorize! :create, @entrepreneur
  end
  
  def create
    @entrepreneur = Entrepreneur.new(params[:entrepreneur])
    
    if @entrepreneur.save
      redirect_to entrepreneur_url(@entrepreneur)
      flash[:notice] = "#{@entrepreneur.first_name} #{@entrepreneur.last_name} successfully added."
    else
      flash.now[:error] = @entrepreneur.errors.full_messages
      render action: "new"
    end
  end
  
  def edit
    @entrepreneur = Entrepreneur.find(params[:id])
    @tours = Tour.where("date > ?", Date.current)
    authorize! :update, @entrepreneur
  end
  
  def update
    @entrepreneur = Entrepreneur.update_attributes(params[:entrepreneur])
    
    if @entrepreneur.save
      redirect_to entrepreneur_url(@entrepreneur)
      flash[:notice] = "#{@entrepreneur.first_name} #{@entrepreneur.last_name} successfully updated."
    else
      flash.now[:error] = @entrepreneur.errors.full_messages
      render action: "edit"
    end
  end
  
  def destroy
    @entrepreneur = Entrepreneur.find(params[:id])
    @entrepreneur.destroy
    redirect_to entrepreneurs_url
  end
  
end

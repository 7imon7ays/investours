class ProjectsController < ApplicationController

  def show
    @project = Project.includes(:entrepreneur, :updates, :loans).order("updates.created_at").find(params[:id])
    @entrepreneur = @project.entrepreneur
    @updates = @project.updates

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
    
    authorize! :create, @project
  end

  def edit
    @entrepreneur = Entrepreneur.find(params[:entrepreneur_id])
    @project = Project.find(params[:id])
    
    authorize! :update, @project
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    @entrepreneur = Entrepreneur.find(params[:entrepreneur_id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to entrepreneur_url(@entrepreneur), notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to entrepreneur_projects_url(params[:entrepreneur]) }
      format.json { head :no_content }
    end
  end
  
end

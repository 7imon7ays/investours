class DashboardsController < ApplicationController

  before_filter :authenticate_user!
  
  def show
    @projects = current_user.backed_projects
  end
  
end

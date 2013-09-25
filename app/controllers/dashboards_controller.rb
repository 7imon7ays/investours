class DashboardsController < ApplicationController

  before_filter :authenticate_user!
  
  def show
    @projects = @user.backed_projects
  end
  
end

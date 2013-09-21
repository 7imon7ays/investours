class DashboardsController < ApplicationController

  before_filter :authenticate_user!
  
  def show
    @user = current_user
    @projects = @user.backed_projects
  end
  
end

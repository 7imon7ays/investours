class DashboardsController < ApplicationController

  before_filter :authenticate_user!
  
  def show
    @user = current_user
    @loans = @user.loans    
  end
  
end

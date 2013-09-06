class SignUpsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
    @tours = Tour.where("date > ?", Date.current)
    @destinations = @tours.map(&:location).uniq
  end
  
  def create
    tour_id = params[:tour_id]
    @tour = Tour.find(tour_id)
    user_id = current_user.id
    
    sign_up = TourSignUp.new(tour_id: tour_id, user_id: user_id)
    
    if sign_up.save
      redirect_to tour_url(@tour)
      flash[:notice] = "Signed up for the #{@tour.start_date} tour in #{@tour.location}!"
    else
      flash[:error] = sign_up.errors.full_messages
      @tours = Tour.where("start_date > ?", Date.current)
      @destinations = @tours.map(&:location).uniq
      render :new
    end    
  end
  
end

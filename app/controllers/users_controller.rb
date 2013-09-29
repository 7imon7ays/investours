class UsersController < ApplicationController
  
  def search
    search_words = params[:query].split(" ")
    @users = []
    search_words.each do |word|
      @users.concat User.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{word}%", "%#{word}%")
    end
    render json: @users
  end
  
end
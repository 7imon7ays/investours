class UserMailer < ActionMailer::Base
  default from: "simis1000@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://investours-web.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to My Awesome Site') do |format|
          format.html { render 'welcome_email.html' }
          format.text { render 'welcome_email.text' }
    end.deliver
  end
end

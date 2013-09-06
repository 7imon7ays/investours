class UserMailer < ActionMailer::Base
  default from: "simis1000@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://investours-web.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to Investours!')
  end
end

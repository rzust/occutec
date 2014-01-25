class UserMailer < ActionMailer::Base
  default from: "no-replay@example.com"
 
  def welcome_email(user, pass)
    @user, @pass = user, pass
    @url  = "#{root_url}users/sign_in"
    mail(to: @user.email, subject: 'Welcome to Ocutec')
  end
end
class UserMailer < ActionMailer::Base

  def registration_email(args)
    @user = args[:user]
    @organization_name = args[:organization_name]
    @organizer_name = args[:organizer_name]
    @url = "http://shindig-sheriff.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to Shindig Sheriff!')
  end
end


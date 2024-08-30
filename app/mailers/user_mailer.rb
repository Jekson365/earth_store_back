class UserMailer < ApplicationMailer
  default from: 'jeko.erg@gmail.com'

  def confirmation_email(user)
    @user = user
    @url = "http://server.testpuzzle.ge/users/confirm?token=#{user.confirmation_token}"
    mail(to: @user.email, subject: 'Confirm your email address') do |format|
      format.text { render plain: "Welcome to our service! Please confirm your email address by clicking the link below:\n\n#{@url}\n\nIf you did not create an account, please ignore this email." }
    end
  end
end

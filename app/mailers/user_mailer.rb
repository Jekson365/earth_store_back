class UserMailer < ApplicationMailer
  def confirmation_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Confirm your email address')
  end
end

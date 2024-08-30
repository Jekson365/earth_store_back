class AdminMailer < ApplicationMailer
  def notification_email
    @user = params[:user]
    mail(to: 'jeko.erg@gmail.com', subject: 'New User Sign Up')
  end
end

class ContactMailer < ApplicationMailer
  def contact
    mail(to: 'jeko.erg@gmail.com',subject: 'test email')
  end
end

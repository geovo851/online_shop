class UserMailer < ApplicationMailer
  default from: 'qast1515@gmail.com'

  def after_confirm_email(user_email)
    mail to: user_email, subject: 'Thank you for registering.'
  end
end

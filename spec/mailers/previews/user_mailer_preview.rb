# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def test_letter
    UserMailer.after_confirm_email('petjy@gmail.com')
  end
end

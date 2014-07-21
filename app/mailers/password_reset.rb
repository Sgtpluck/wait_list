class PasswordReset < ActionMailer::Base
  default from: "ada@helplist.com"

  def reset(adie, password)
    @adie = adie
    @password = password
    mail(to: @adie['email'], subject: 'Password Reset')
  end
end

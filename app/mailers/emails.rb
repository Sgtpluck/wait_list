class Emails < ActionMailer::Base
  default from: "ada@helplist.com"

  def reset(adie, password)
    @adie = adie
    @password = password
    mail(to: @adie['email'], subject: 'Password Reset')
  end

  def welcome(adie, password)
    @adie = Adie.find(adie['id'])
    @password = password
    mail(to: @adie['email'], subject: 'Welcome to the helplist!')
  end
end

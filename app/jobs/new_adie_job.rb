class NewAdieJob
  extend HerokuResqueAutoscaler if Rails.env.production?

  @queue = :email
  def self.perform(adie,password)
    Emails.welcome(adie, password).deliver
  end
end

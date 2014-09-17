class PasswordResetJob
  extend HerokuResqueAutoscaler if Rails.env.production?

  @queue = :email
  def self.perform(adie,password)
    Emails.password_reset(adie, password).deliver
  end
end

class EmailJob
  extend HerokuResqueAutoscaler if Rails.env.production?

  @queue = :email
  def self.perform(adie,password)
    PasswordReset.reset(adie, password).deliver
  end
end

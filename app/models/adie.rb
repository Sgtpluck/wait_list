class Adie < ActiveRecord::Base
  require 'securerandom'
  has_secure_password
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :problems #but a dude ain't one
  mount_uploader :adatar, AdatarUploader

  def create_random_password
    password = SecureRandom.hex[0..9]
    self.update(password: password, password_confirmation: password)
    Resque.enqueue(EmailJob, self, password) if self.save
  end

end

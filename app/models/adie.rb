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

  def self.bulk_upload(csv_file)
    CSV.foreach(csv_file.path, headers: true) do |row|
      password = SecureRandom.hex[0..9]
      puts password
      Adie.create(
        name: row[0],
        email: row[1],
        password: password,
        ta: row[2],
        admin: row[3],
        current: row[4]
        )
    end
  end

end

class Adie < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :problems #but a dude ain't one
  mount_uploader :adatar, AdatarUploader
  validates :adatar, presence: true

end

class Adie < ActiveRecord::Base
  
  has_secure_password
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :problems
  mount_uploader :adatar, AdatarUploader

  
end

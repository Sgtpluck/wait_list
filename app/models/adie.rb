class Adie < ActiveRecord::Base
  has_many :problems
  mount_uploader :adatar, AdatarUploader
  
end

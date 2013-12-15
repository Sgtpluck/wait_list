class Adie < ActiveRecord::Base
  
  has_many :problems
  
  has_secure_password
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
end

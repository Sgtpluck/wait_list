class Adie < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :problems #but a dude ain't one
  mount_uploader :adatar, AdatarUploader
  has_one :provider

  def update_from_omniauth(auth_hash)
  end

end

class Adie < ActiveRecord::Base
  has_many :problems
  mount_uploader :adatar, adatar_uploader
end

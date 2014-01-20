class Rating < ActiveRecord::Base
  belongs_to :problem
  
  validates :helper,        presence: true
  validates :rating,        presence: true
  validates :satisfaction,  presence: true
end

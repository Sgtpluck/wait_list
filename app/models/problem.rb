class Problem < ActiveRecord::Base
  validates :type, presence: true
  validates :estimate, presence: true
  validates :description, presence: true
  validates :adie_id, presence: true

  belongs_to :adie
  self.inheritance_column = nil

end

class Problem < ActiveRecord::Base
  validates :type, presence: true
  validates :estimate, presence: true
  validates :description, presence: true
  validates :adie_id, presence: true

  belongs_to :adie
  self.inheritance_column = nil

  def self.report(problem, room = Figaro.env.campfire_default_room)
    campfire = Tinder::Campfire.new Figaro.env.campfire_subdomain,
                                    token: Figaro.env.campfire_token

    room = campfire.find_room_by_name(room)
    room.speak problem
  end

end

class Problem < ActiveRecord::Base
  validates :type,        presence: true
  validates :estimate,    presence: true
  validates :description, presence: true
  validates :adie_id,     presence: true
  has_one :rating

  belongs_to :adie
  self.inheritance_column = nil

  def self.find_room(room = Figaro.env.campfire_default_room)
    campfire = Tinder::Campfire.new Figaro.env.campfire_subdomain,
                                    token: Figaro.env.campfire_token

    @room = campfire.find_room_by_name(room)
  end

  def self.report(problem)
    find_room
    @room.speak problem
    @room.play 'trombone'
  end

  def self.check_in(problem)
    find_room
    @room.speak problem
    @room.play 'crickets'
  end

  def self.high_ratings
    includes(:ratings).where(:"ratings.rating" => 5)
  end

  def self.reminder
    where(helped: 'needs help').each do |problem|
      seconds = (Time.now - problem.created_at)
      if seconds > 600 && seconds < 1200
        check_in("#{Adie.find(problem.adie_id).name} STILL needs help. Can " +
                   "someone check it out, already? " +
                   "-- http://helplist.herokuapp.com/problems")
      elsif seconds > 1200
        check_in("Ahem. #{Adie.find(problem.adie_id).name} is STILL waiting. " +
                   "Get ON this -- http://helplist.herokuapp.com/problems")
      end
    end
  end

end

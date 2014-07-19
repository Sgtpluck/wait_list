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

  def self.report(problem, sound = 'trombone')
    @room ||= find_room
    @room.speak "#{Adie.find(problem.adie_id).name} is having a " +
                     "problem with #{problem.type}. The problem is " +
                     "#{problem.description}. Estimated time to fix: " +
                     "#{problem.estimate} -- http://helplist.herokuapp.com/problems"
    @room.play sound unless sound.nil?
  end

  def self.high_ratings
    includes(:ratings).where(:"ratings.rating" => 5)
  end

  def self.reminder
    where(helped: 'needs help').each do |problem|
      if wait_time > 600 && wait_time < 1200
        # (ノ°□°)ノ彡 ┻━┻
        report("#{Adie.find(problem.adie_id).name} STILL needs help. Can " +
                 "someone check it out, already? " +
                 "-- http://helplist.herokuapp.com/problems",
               'crickets')
      elsif wait_time > 1200
        report("Ahem. #{Adie.find(problem.adie_id).name} is STILL waiting. " +
                 "Get ON this -- http://helplist.herokuapp.com/problems",
               'crickets')
      end
    end
  end

  def wait_time
    Time.now - created_at
  end
end

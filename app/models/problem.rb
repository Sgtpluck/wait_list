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

  def self.get_mad(problem)
    find_room
    @room.speak problem
    @room.play 'crickets'
  end

  def self.high_ratings
    includes(:ratings).where(:"ratings.rating" => 5)
  end

  def self.reminder
   where(helped: 'needs help').each do |problem|
    # Having trouble accessing 'created_at' figure out why and how to fix.
      if (Time.now - problem.created_at) > 600
        puts 'this works'
      else
        puts "ten minutes is a long time"
        # get_mad("#{Adie.find(problem.adie_id).name} STILL needs help. Can someone check it out, already? -- http://helplist.herokuapp.com/problems")
      end
    end
  end

end

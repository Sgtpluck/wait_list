class Adie < ActiveRecord::Base
  
  include Enumerable

  def each(&block)
    rankings = ["one", "two", "three", "four", "five"]
    rankings.each do |method_string|
      block.call(send method_string)
    end
  end
  
  has_many :problems
  
  has_secure_password
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  
end

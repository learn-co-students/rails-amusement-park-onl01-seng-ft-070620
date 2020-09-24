class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

# returns different strings based on happiness:nausea ratings
  def mood
    return "sad" if self.nausea > self.happiness
    return "happy" if self.nausea < self.happiness
  end
end

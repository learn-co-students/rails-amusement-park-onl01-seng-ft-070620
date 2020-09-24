class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

# returns whether the user is permitted to take a ride on the attraction
  def take_ride
    rejection = ""
    if self.user.tickets < self.attraction.tickets
      rejection += "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end

    if self.user.height < self.attraction.min_height
      if rejection.empty?
        rejection += "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      else
        rejection += " You are not tall enough to ride the #{self.attraction.name}."
      end
    end

    rejection.empty? ? self.update_user_attributes : rejection
  end

# updates the user's attributes when they take a ride
  def update_user_attributes
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
    return "Thanks for riding the #{self.attraction.name}!"
  end
end

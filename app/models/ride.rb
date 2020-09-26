class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user

    def take_ride
       if self.user.tickets > self.attraction.tickets && self.attraction.min_height >= self.user.height
            #add code so user can ride
       elsif self.user.tickets > self.attraction.tickets && !(self.user.tickets < self.attraction.tickets) 
            "Sorry. " + not_enough_tickets
       elsif self.attraction.min_height >= self.user.height
            "Sorry. " + not_tall_enough
       else 
            # add code for too short and not enough tickets
       end
    end
end

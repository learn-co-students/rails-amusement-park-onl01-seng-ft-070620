class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride

        if tall_enough? && enough_tickets?
            new_tickets = self.user.tickets - self.attraction.tickets
            new_happiness = self.attraction.happiness_rating
            new_nausea = self.attraction.nausea_rating

            self.user.update(
                :happiness => new_happiness,
                :nausea => new_nausea,
                :tickets => new_tickets
            )
            "Thanks for riding the #{self.attraction.name}!"
        elsif !tall_enough? && enough_tickets?
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif tall_enough? && !enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        end
    end

    def tall_enough?
        self.user.height >= self.attraction.min_height
    end

    def enough_tickets?
        self.user.tickets >= self.attraction.tickets
    end

end

class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def update_user
    # byebug
    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save
  end

  def take_ride
    # byebug
    if enough_tickets? && tall_enough?
      update_user
      "Thanks for riding the #{attraction.name}!"
    elsif !enough_tickets? && tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif enough_tickets? && !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end
end

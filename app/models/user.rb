class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        unless self.happiness.nil? || self.nausea.nil?
            self.happiness > self.nausea ? 'happy' : 'sad'
        else
            nil
        end
    end
end

class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    validates :name, presence: true

    def mood
        if self.nausea && self.happiness
            if self.nausea > self.happiness
                "sad"
            elsif self.happiness >= self.nausea
                "happy"
            end
        end
    end

end

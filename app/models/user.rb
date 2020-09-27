class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if nausea && happiness
            nausea > happiness ? "sad" : "happy"
        else
            "Enter nausea and happiness to determine mood"
        end
    end

end

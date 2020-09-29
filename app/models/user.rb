# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    return if admin

    happiness > nausea ? 'happy' : 'sad'
  end
end

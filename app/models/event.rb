class Event < ApplicationRecord
  has_many :village_events
  has_many :villages, through: :village_events
end

class Event < ApplicationRecord
  has_many :village_events, dependent: :destroy
  has_many :villages, through: :village_events

  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :time, presence: true
  validates :adult_required, inclusion: { in: [ true, false ] }
end

class Event < ApplicationRecord
  belongs_to :village
  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :time, presence: true
  validates :adult_required, inclusion: { in: [ true, false ] }
end

class Village < ApplicationRecord
  has_many :village_members, dependent: :destroy
  has_many :village_events, dependent: :destroy
  has_many :users, through: :village_members
  has_many :events, through: :village_events

  validates :name, presence: true
end

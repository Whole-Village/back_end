class Village < ApplicationRecord
  has_many :events
  has_many :village_members, dependent: :destroy
  has_many :users, through: :village_members

  validates :name, presence: true
end

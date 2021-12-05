class User < ApplicationRecord
  has_secure_password
  has_many :children
  has_many :village_members
  has_many :villages, through: :village_members

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :covid_vaccinated, presence: true
  validates :volunteer_credits, presence: true
end

class User < ApplicationRecord
  has_secure_password
  has_many :children, dependent: :destroy
  has_many :village_members, dependent: :destroy
  has_many :villages, through: :village_members

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :covid_vaccinated, inclusion: { in: [true, false] }
  validates :volunteer_credits, presence: true
end

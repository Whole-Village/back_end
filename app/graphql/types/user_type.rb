module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :password_digest, String, null: true
    field :phone_number, String, null: true
    field :address, String, null: true
    field :covid_vaccinated, Boolean, null: true
    field :volunteer_credits, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

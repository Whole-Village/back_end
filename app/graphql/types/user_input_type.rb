module Types
  module Input
    class UserInputType < Types::BaseInputObject
      argument :first_name, String, require: true
      argument :last_name, String, require: true
      argument :email, String, require: true
      argument :phone_number, String, require: true
      argument :address, String, require: true
      argument :covid_vaccinated, Boolean, require: true
      argument :volunteer_credits, String, require: true
    end
  end
end

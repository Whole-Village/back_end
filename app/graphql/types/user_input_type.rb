module Types
  module Input
    class UserInputType < Types::BaseInputObject
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :phone_number, String, required: true
      argument :address, String, required: true
      argument :covid_vaccinated, Boolean, required: true
      argument :volunteer_credits, String, required: true
    end
  end
end

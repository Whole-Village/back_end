class Mutations::CreateUser < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :phone_number, String, required: true
  argument :address, String, required: true
  argument :covid_vaccinated, Boolean, required: true
  argument :volunteer_credits, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(first_name:, last_name:, email:, phone_number:, address:,
              covid_vaccinated:, volunteer_credits:)
    user = User.new(first_name: first_name, last_name: last_name,
                    email: email, phone_number: phone_number,
                    address: address, covid_vaccinated: covid_vaccinated,
                    volunteer_credits: volunteer_credits)
    if user.save
      {
        user: user,
        errors: [],
      }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end

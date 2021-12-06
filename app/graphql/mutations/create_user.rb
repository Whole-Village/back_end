class Mutations::CreateUser < Mutations::BaseMutation
  argument :id, ID, required: false
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true
  argument :phone_number, String, required: true
  argument :address, String, required: true
  argument :covid_vaccinated, Boolean, required: true
  argument :volunteer_credits, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: true

  def resolve(first_name:,
              last_name:,
              email:,
              password:,
              phone_number:,
              address:,
              covid_vaccinated:,
              volunteer_credits:)

    user = User.new(first_name: first_name,
                    last_name: last_name,
                    email: email,
                    password: password,
                    phone_number: phone_number,
                    address: address,
                    covid_vaccinated: covid_vaccinated,
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

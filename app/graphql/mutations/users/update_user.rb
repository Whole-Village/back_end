class Mutations::Users::UpdateUser < Mutations::BaseMutation
  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :email, String, required: true
  argument :password, String, required:false
  argument :phone_number, String, required: false
  argument :address, String, required: false
  argument :covid_vaccinated, Boolean, required: false
  argument :volunteer_credits, String, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: true

  def resolve(**args)
    user = User.find_by!(email: args[:email])
    if user.update(args)
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        error: user.errors.full_messages
      }
    end
  rescue ActiveRecord::RecordNotFound => _e
    GraphQL::ExecutionError.new('User does not exist.')
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
    " #{e.record.errors.full_messages.join(', ')}")
  end
end

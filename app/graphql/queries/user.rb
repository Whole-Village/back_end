class Queries::User < Queries::BaseQuery
  type Types::UserType, null: false
    argument :email, String, required: true
    # description: "Fetch single user"

  def resolve(email:)
    User.find_by(email: email)
  rescue ActiveRecord::RecordNotFound => _e
    GraphQL::ExecutionError.new('User does not exist.')
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
      " #{e.record.errors.full_messages.join(', ')}")
  end
end

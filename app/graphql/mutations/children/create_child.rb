class Mutations::Children::CreateChild < ::Mutations::BaseMutation
  argument :id, ID, required: false
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :birthdate, String, required: true
  argument :user_id, ID, required: true

  field :child, Types::ChildType, null: true
  field :errors, [String], null: true
  field :user_email, String, null: true

  def user_email
    object.user.email
  end

  def resolve(user_id:, **args)
    user = User.find(user_id)
    child = user.children.new(args)
    if child.save
      {
        child: child,
        errors: []
      }
    else
      {
        child: nil,
        errors: child.errors.full_messages
      }
    end
  rescue ActiveRecord::RecordNotFound => _e
    GraphQL::ExecutionError.new('User does not exist.')
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
    " #{e.record.errors.full_messages.join(', ')}")
  end
end

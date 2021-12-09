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
    child = User.find(user_id).children.new(args)
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
  end
end

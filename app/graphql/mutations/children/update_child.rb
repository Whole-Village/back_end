class Mutations::Children::UpdateChild < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :birthdate, String, required: false

  field :child, Types::ChildType, null: false
  field :errors, [String], null: true
  field :user_email, String, null: false

  def user_email
    object.user.email
  end

  def resolve(id:, **args)
    child = Child.find(id)

    if child.update!(args)
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

class Queries::Children < Queries::BaseQuery
  type [Types::ChildType], null: false
    argument :user_id, ID, required: true

  def resolve(user_id:)
    User.find(user_id).children.all
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('user does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
      " #{e.record.errors.full_messages.join(', ')}")
  end
end

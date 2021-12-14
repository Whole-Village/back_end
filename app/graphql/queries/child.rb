class Queries::Child < Queries::BaseQuery
  type Types::ChildType, null: false
    argument :id, ID, required: true

  def resolve(id:)
    Child.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('child does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
      " #{e.record.errors.full_messages.join(', ')}")
  end
end

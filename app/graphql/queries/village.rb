class Queries::Village < Queries::BaseQuery
  type Types::VillageType, null: false
  argument :id, ID, required: true

  def resolve(id:)
    Village.find(id)
  rescue ActiveRecord::RecordNotFound => _e
    GraphQL::ExecutionError.new('Village does not exist.')
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
      " #{e.record.errors.full_messages.join(', ')}")
  end
end

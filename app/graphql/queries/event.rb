class Queries::Event < Queries::BaseQuery
  type Types::EventType, null: false
    argument :id, ID, required: true
    # argument :village_id, ID, required: true

  def resolve(id:)
    Event.find(id)
  rescue ActiveRecord::RecordNotFound => _e
  GraphQL::ExecutionError.new('event does not exist.')
  rescue ActiveRecord::RecordInvalid => e
  GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
  " #{e.record.errors.full_messages.join(', ')}")

  end
end

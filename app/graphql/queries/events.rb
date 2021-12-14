class Queries::Events < Queries::BaseQuery
  type [Types::EventType], null: false
    # description: "Fetch all events"
    argument :village_id, ID, required: true

  def resolve(village_id:)
    Village.find(village_id).events.all.order(date: :desc)
    rescue ActiveRecord::RecordNotFound => _e
    GraphQL::ExecutionError.new('village does not exist.')
    rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
    " #{e.record.errors.full_messages.join(', ')}")
  end
end

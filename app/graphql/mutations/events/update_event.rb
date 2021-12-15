class Mutations::Events::UpdateEvent < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :description, String, required: false
  argument :date, String, required: false
  argument :time, String, required: false
  argument :adult_required, Boolean, required: false
  # argument :village_id, ID, required: true

  field :event, Types::EventType, null: false
  field :errors, [String], null: true
  field :village_name, String, null: false

  def village_name
    object.village.name
  end

  def resolve(id:, **args)
    event = Event.find(id)
    if event.update!(args)
      {
        event: event,
        errors: []
      }
    else
      {
        event: nil,
        error: event.errors.full_messages
      }
    end
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Event does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
    " #{e.record.errors.full_messages.join(', ')}")
  end
end

class Mutations::Events::CreateEvent < ::Mutations::BaseMutation
  argument :id, ID, required: false
  argument :name, String, required: true
  argument :description, String, required: true
  argument :date, String, required: true
  argument :time, String, required: true
  argument :adult_required, Boolean, required: true
  argument :village_id, ID, required: true

  field :event, Types::EventType, null: true
  field :errors, [String], null: true
  field :village_name, String, null: true

  def village_name
    object.village.name
  end

  def resolve(village_id:, **args)
    event = Village.find(village_id).events.new(args)
    if event.save
      {
        event: event,
        errors: []
      }
    else
      {
        event: nil,
        errors: event.errors.full_messages
      }
    end
  end
end

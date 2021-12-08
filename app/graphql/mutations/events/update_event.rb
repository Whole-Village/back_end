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
    Event.find(id).tap do |event|
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
    end
  end
end

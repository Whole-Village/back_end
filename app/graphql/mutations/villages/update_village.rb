class Mutations::Events::UpdateVillage < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :description, String, required: false

  field :village, Types::VillageType, null: false
  field :errors, [String], null: true

  def resolve(id:, **args)
    Village.find(id).tap do |event|
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

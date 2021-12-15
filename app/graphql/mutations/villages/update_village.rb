class Mutations::Villages::UpdateVillage < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :description, String, required: false

  field :village, Types::VillageType, null: false
  field :errors, [String], null: true

  def resolve(id:, **args)
    village = Village.find(id)
    if village.update!(args)
      {
        village: village,
        errors: []
      }
    else
      {
        village: nil,
        error: village.errors.full_messages
      }
    end
    rescue ActiveRecord::RecordNotFound => _e
    GraphQL::ExecutionError.new('Village does not exist.')
    rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
    " #{e.record.errors.full_messages.join(', ')}")
  end
end

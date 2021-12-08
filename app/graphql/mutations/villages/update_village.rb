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
  end
end

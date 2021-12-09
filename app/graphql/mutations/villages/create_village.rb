class Mutations::Villages::CreateVillage < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String, required:false

  field :village, Types::VillageType, null: true
  field :errors, [String], null: false

  def resolve(name:,
              description:)

    village = Village.new(name: name,
                          description: description)
    if village.save
      {
        village: village,
        errors: []
      }
    else
      {
        village: nil,
        errors: village.errros.full_messages
      }
    end
  end
end

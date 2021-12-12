class Mutations::Villages::CreateVillage < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String, required: false
  argument :user_emails, [String], required: false

  field :village, Types::VillageType, null: true
  field :errors, [String], null: false

  def resolve(name:,
              description:, user_emails:)
    village = Village.new(name: name,
                          description: description)

    if village.save
      user_emails.each do |u|
        village.village_members.create(user: User.find_by(email: u))
      end
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

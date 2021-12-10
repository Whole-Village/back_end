class Mutations::VillageMembers::CreateVillageMember < ::Mutations::BaseMutation
  argument :village_id, ID, required: true
  argument :user_email, String, required: true

  field :village, Types::VillageType, null: true
  field :user, Types::UserType, null: true
  field :errors, [String], null: true

  def resolve(village_id:, user_email:)
    member = VillageMember.new(village: Village.find(village_id),
                               user: User.find_by(email: user_email)
    )
    if member.save
      {
        village: member.village,
        user: member.user,
        errors: []
      }
    else
      {
        event: nil,
        errors: member.errors.full_messages
      }
    end
  end
end

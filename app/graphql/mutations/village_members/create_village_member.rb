class Mutations::VillageMembers::CreateVillageMember < ::Mutations::BaseMutation
  argument :village_id, ID, required: false
  argument :user_id, ID, required: false

  field :village, Types::VillageType, null: true
  field :user, Types::UserType, null: true
  field :errors, [String], null: true

  def resolve(village_id:, user_id:)
    member = VillageMember.new(village: Village.find(village_id),
                               user: User.find(user_id)
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

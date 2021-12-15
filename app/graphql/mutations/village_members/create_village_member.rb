class Mutations::VillageMembers::CreateVillageMember < ::Mutations::BaseMutation
  argument :village_id, ID, required: true
  argument :user_email, String, required: true

  field :village, Types::VillageType, null: true
  field :user, Types::UserType, null: true
  field :errors, [String], null: true

  def resolve(village_id:, user_email:)
    user = User.find_by(email: user_email)
    village = Village.find(village_id)
    member = VillageMember.new(village: village, user: user)
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
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('User or Village does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attribute(s) for #{e.record.class}:"\
      " #{e.record.errors.full_messages.join(', ')}")
  end
end

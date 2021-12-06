class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  field :users, resolver: Queries::Users
  field :user, resolver: Queries::User
  field :village, Types::VillageType, null: false do
    argument :id, ID, required: true
  end

  def village(id:)
    Village.find(id)
  end
end

class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  field :users, resolver: Queries::Users
  field :user, resolver: Queries::User
end

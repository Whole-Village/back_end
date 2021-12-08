class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  field :users, resolver: Queries::Users
  field :user, resolver: Queries::User

  field :events, resolver: Queries::Events
  field :event, resolver: Queries::Event
  field :village, resolver: Queries::Village
  field :children, resolver: Queries::Children
  field :child, resolver: Queries::Child
end

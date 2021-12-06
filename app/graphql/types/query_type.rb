module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    # field :users, resolver: Queries::Users
    # field :user, resolver: Queries::FetchUser
    field :users, [Types::UserType], null: false,
      description: 'Fetch all users'

    def users
      User.all.order(created_at: :desc)
    end

    field :user, [Types::UserType], null: false do
      argument :email, String, required: true
    end

    def user(email:)
      User.find_by(email: email)
    end

    field :village, Types::VillageType, null: false do
      argument :id, ID, required: true
    end

    def village(id:)
      Village.find(id)
    end
  end
end

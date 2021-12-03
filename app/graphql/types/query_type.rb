module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :fetch_users, resolver: Queries::FetchUsers
    # field :fetch_user, resolver: Queries::FetchUser
    # field :fetch_users, [UserType], null: false
    field :fetch_user, Types::UserType, null: false do
      argument :email, String, required: true
    end

    def fetch_user(email:)
      User.find_by(email: email)
    end

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end
  end
end

class Queries::Users < Queries::BaseQuery
  type [Types::UserType], null: false
    # description: "Fetch all users"

  def resolve
    User.all.order(created_at: :desc)
  end
end

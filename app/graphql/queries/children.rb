class Queries::Children < Queries::BaseQuery
  type [Types::ChildType], null: false
    argument :user_id, ID, required: true

  def resolve(user_id:)
    User.find(user_id).children.all
  end
end

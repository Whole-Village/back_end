class Queries::Child < Queries::BaseQuery
  type Types::ChildType, null: false
    argument :id, ID, required: true

  def resolve(id:)
    Child.find(id)
  end
end

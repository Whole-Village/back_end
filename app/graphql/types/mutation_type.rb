class Types::MutationType < Types::BaseObject
  field :create_user, mutation: Mutations::CreateUser
  field :update_user, mutation: Mutations::UpdateUser
  field :create_village, mutation: Mutations::CreateVillage
end

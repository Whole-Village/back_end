class Types::MutationType < Types::BaseObject
  field :create_user, mutation: Mutations::Users::CreateUser
  field :update_user, mutation: Mutations::Users::UpdateUser

  field :create_village, mutation: Mutations::CreateVillage

  field :create_event, mutation: Mutations::Events::CreateEvent
  field :update_event, mutation: Mutations::Events::UpdateEvent
end

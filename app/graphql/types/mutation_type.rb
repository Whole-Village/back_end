class Types::MutationType < Types::BaseObject
  # field :create_user, mutation: Mutations::Users::CreateUser
  # field :update_user, mutation: Mutations::Users::UpdateUser

  field :create_village, mutation: Mutations::Villages::CreateVillage
  field :update_village, mutation: Mutations::Villages::UpdateVillage

  field :create_event, mutation: Mutations::Events::CreateEvent
  field :update_event, mutation: Mutations::Events::UpdateEvent

  field :create_child, mutation: Mutations::Children::CreateChild
  field :update_child, mutation: Mutations::Children::UpdateChild
end

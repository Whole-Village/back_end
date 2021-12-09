module Types
  class ChildType < Types::BaseObject
    field :id, ID, null:false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :birthdate, String, null: true
    field :user_id, ID, null: false
    field :user_email, String, null: false

    def user_id
      object.user.id
    end

    def village_name
      object.user.email
    end
  end
end

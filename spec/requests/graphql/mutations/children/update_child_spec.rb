require 'rails_helper'

RSpec.describe 'update child mutation' do
  describe 'happy path' do
    it 'successfully updates the user when the correct id is sent' do
      create(:user)
      create_list(:child, 5, user_id: User.first.id)

      result = BackEndSchema.execute(valid_mutation(child_id: Child.first.id)).as_json

      expect(result["data"]["updateChild"]["child"]["firstName"]).to eq("Homer")
      expect(result["data"]["updateChild"]["child"]["lastName"]).to eq("Simpson")
      expect(result["data"]["updateChild"]["child"]["birthdate"]).to eq("1898-05-21")
      expect(result["data"]["updateChild"]["errors"]).to be_empty
    end
  end

  describe 'sad path' do
    it 'does not update if no child matches the given id' do
      result = BackEndSchema.execute(valid_mutation(child_id: 1)).as_json

      expect(result["errors"].first["message"]).to eq("Child does not exist.")
      expect(result["data"]).to be_falsey
    end
  end

  def valid_mutation(child_id:)
    <<~GQL
    mutation {
      updateChild(
        id: "#{child_id}"
        firstName: "Homer"
        lastName: "Simpson"
        birthdate: "1898-05-21"
      )
      {
        child {
          firstName
          lastName
          birthdate
        }
        errors
      }
    }
    GQL
  end
end

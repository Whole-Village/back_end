require 'rails_helper'

RSpec.describe 'create child mutation' do
  describe 'happy path' do
    it 'successfully creates a new child' do
      user = create(:user)
      result = BackEndSchema.execute(valid_mutation(user_id: user.id)).as_json

      expect(result["data"]["createChild"]["child"]["firstName"]).to eq("Bart")
      expect(result["data"]["createChild"]["child"]["lastName"]).to eq("Simpson")
      expect(result["data"]["createChild"]["errors"]).to be_empty
    end
  end

  describe 'sad path' do
    it 'does not create the child if the user_id is invalid' do
      result = BackEndSchema.execute(valid_mutation(user_id: 1)).as_json

      expect(result["errors"].first["message"]).to eq("User does not exist.")
      expect(result["data"]).to be_falsey
    end
  end

  def valid_mutation(user_id:)
    <<~GQL
    mutation {
      createChild(
        userId: "#{user_id}"
        firstName: "Bart"
        lastName: "Simpson"
        birthdate: "1989-08-21"
      )
      {
        child {
          firstName
          lastName
        }
        errors
      }
    }
    GQL
  end
end

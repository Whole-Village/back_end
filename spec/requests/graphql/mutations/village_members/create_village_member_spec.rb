require 'rails_helper'

RSpec.describe 'create village member mutation' do
  describe 'happy path' do
    it 'successfully creates a village member' do
      user = create(:user)
      village = create(:village)

      result = BackEndSchema.execute(valid_mutation(village_id: village.id, user_email: user.email)).as_json

      expect(result["data"]["createVillageMember"]["village"]["name"]).to eq(village.name)
      expect(result["data"]["createVillageMember"]["village"]["description"]).to eq(village.description)
      expect(result["data"]["createVillageMember"]["user"]["email"]).to eq(user.email)
      expect(result["data"]["createVillageMember"]["errors"]).to be_empty
    end
  end

  describe 'sad path' do
    it 'does not allow the village member to create if the village does not exist' do
      user = create(:user)

      result = BackEndSchema.execute(valid_mutation(village_id: 1, user_email: user.email)).as_json

      expect(result["errors"].first["message"]).to eq("User or Village does not exist.")
      expect(result["data"]).to be_falsey
    end

    it 'does not allow for the village member to be created when the user with email does not exist' do
      village = create(:village)

      result = BackEndSchema.execute(valid_mutation(village_id: village.id, user_email: "onwqorfn")).as_json

      expect(result["data"]["createVillageMember"]["errors"].first).to eq("User must exist")
    end
  end

  def valid_mutation(village_id:, user_email:)
    <<~GQL
    mutation {
      createVillageMember(
        villageId: "#{village_id}"
        userEmail: "#{user_email}"
      )
      {
        village {
          name
          description
        }
        user {
          email
        }
        errors
      }
    }
    GQL
  end
end

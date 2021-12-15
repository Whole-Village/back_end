require 'rails_helper'

RSpec.describe 'create event mutation' do
  describe 'happy path' do
    it 'successfully creates a new village' do
      create(:village)
      result = BackEndSchema.execute(valid_mutation(village_id: Village.first.id)).as_json

      expect(result["data"]["createEvent"]["event"]["name"]).to eq("Homer's birthday")
      expect(result["data"]["createEvent"]["event"]["description"]).to eq("35th birthday")
      expect(result["data"]["createEvent"]["event"]["date"]).to eq("2021-12-21")
      expect(result["data"]["createEvent"]["event"]["time"]).to eq("08:30")
      expect(result["data"]["createEvent"]["event"]["time"]).to eq("08:30")
      expect(result["data"]["createEvent"]["errors"]).to be_empty
    end
  end

  describe 'sad path' do
    it 'does not create the event when the village id does match a record' do
      result = BackEndSchema.execute(invalid_mutation(village_id: 1)).as_json

      expect(result["errors"].first["message"]).to eq("Village does not exist.")
      expect(result["data"]).to be_falsey
    end
  end

  def valid_mutation(village_id:)
    <<~GQL
    mutation {
      createEvent(
        villageId: "#{village_id}"
        name: "Homer's birthday"
        description: "35th birthday"
        date: "2021-12-21"
        time: "08:30"
        adultRequired: false
      )
      {
        event {
          name
          description
          date
          time
        }
        errors
      }
    }
    GQL
  end

  def invalid_mutation(village_id:)
    <<~GQL
    mutation {
      createEvent(
        villageId: "#{village_id}"
        name: "Homer's birthday"
        description: "35th birthday"
        date: "2021-12-21"
        time: "08:30"
        adultRequired: false
      )
      {
        event {
          name
          description
          date
          time
        }
        errors
      }
    }
    GQL
  end
end

require 'rails_helper'

RSpec.describe 'update village mutation' do
  describe 'happy path' do
    it 'successfully updates an event' do
      create(:village)
      create_list(:event, 5, village_id: Village.first.id)
      result = BackEndSchema.execute(valid_mutation(event_id: Event.first.id)).as_json

      expect(result["data"]["updateEvent"]["event"]["name"]).to eq("Homer's birthday")
      expect(result["data"]["updateEvent"]["event"]["date"]).to eq("2021-12-15")
    end
  end

  describe 'sad path' do
    it 'does not update if the id does not match an event' do
      create(:village)
      create_list(:event, 5, village_id: Village.first.id)
      result = BackEndSchema.execute(valid_mutation(event_id: 1)).as_json

      expect(result["errors"].first["message"]).to eq("Event does not exist.")
      expect(result["data"]).to be_falsey
    end
  end

  def valid_mutation(event_id:)
    <<~GQL
    mutation {
      updateEvent(
        id: "#{event_id}"
        name: "Homer's birthday"
        date: "2021-12-15"
      )
      {
        event {
          name
          description
          date
        }
        errors
      }
    }
    GQL
  end
end

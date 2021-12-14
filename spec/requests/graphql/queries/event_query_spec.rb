require 'rails_helper'

RSpec.describe 'Query for getting back one event' do
  describe 'happy path' do
    it 'finds the event with the matching id' do
      create(:village)
      create_list(:event, 5, village_id: Village.first.id)
      event_id = Event.first.id
      result = BackEndSchema.execute(query(event_id: event_id)).as_json

      expect(result["data"]["event"]["name"]).to eq(Event.first.name)
      expect(result["data"]["event"]["description"]).to eq(Event.first.description)
      expect(result["data"]["event"]["date"]).to eq(Event.first.date)
      expect(result["data"]["event"]["time"]).to eq(Event.first.time)
      expect(result["data"]["event"]["id"]).to eq(Event.first.id.to_s)
    end
  end

  describe 'sad path' do
    it 'does not return an event when there is no event with a matching ID' do
      create(:village)
      result = BackEndSchema.execute(query(event_id: 1)).as_json
      expect(result["errors"].first["message"]).to eq("event does not exist.")
    end
  end

  describe 'edge case' do
    it 'returns an error when a nil value is sent in for the event id' do
      create(:village)
      result = BackEndSchema.execute(query(event_id: nil)).as_json
      expect(result["errors"].first["message"]).to eq("event does not exist.")
    end
  end

  def query(event_id:)
    <<~GQL
    query {
      event(id: "#{event_id}"){
        name
        description
        time
        date
        id
      }
    }
    GQL
  end
end

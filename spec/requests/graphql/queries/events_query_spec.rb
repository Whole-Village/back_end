require 'rails_helper'

RSpec.describe 'query for all events in a village' do
  describe 'happy path' do
    it 'lists out all the events for a specific village' do
      village = create(:village)
      create_list(:event, 5, village_id: village.id)
      result = BackEndSchema.execute(query(village_id: village.id)).as_json

      result["data"]["events"].each do |event|
        expect(event["name"]).to be_a String
        expect(event["description"]).to be_a String
        expect(event["date"]).to be_a String
        expect(event["time"]).to be_a String
      end
    end

    describe 'sad path' do
      it 'retuns an empty array when there are no events' do
        village = create(:village)
        result = BackEndSchema.execute(query(village_id: village.id)).as_json

        expect(result["data"]["events"]).to be_empty
      end
    end

    describe 'edge case' do
      it 'returns an error when there isnt a village matching the id given' do
        result = BackEndSchema.execute(query(village_id: "1")).as_json

        expect(result["errors"].first["message"]).to eq("village does not exist.")
      end
    end
  end


  def query(village_id:)
    <<~GQL
    query {
      events(villageId: "#{village_id}"){
        name
        description
        date
        time
      }
    }
    GQL
  end
end

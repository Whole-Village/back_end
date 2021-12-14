require 'rails_helper'

RSpec.describe 'query for one village by ID' do
  describe 'happy path' do
    it 'returns the correct village when an ID is sent' do
      villages = create_list(:village, 10)
      village_id = villages.first.id

      result = BackEndSchema.execute(query(village_id: village_id)).as_json

      expect(result["data"]["village"]["name"]).to eq(villages.first.name)
      expect(result["data"]["village"]["description"]).to eq(villages.first.description)
      expect(result["data"]["village"]["id"]).to eq(village_id.to_s)
    end
  end

  describe 'sad path' do
    it 'returns an error when there is no village that matches the given id' do
      result = BackEndSchema.execute(query(village_id: 1)).as_json
      expect(result["errors"].first["message"]).to eq("Village does not exist.")
    end
  end

  describe 'edge path' do
    it 'returns an error when there is a nil value submitted for the village_id' do
      result = BackEndSchema.execute(query(village_id: nil)).as_json
      expect(result["errors"].first["message"]).to eq("Village does not exist.")
    end 
  end

  def query(village_id:)
    <<~GQL
    query {
      village(id: "#{village_id}"){
        name
        description
        id
      }
    }
    GQL
  end
end

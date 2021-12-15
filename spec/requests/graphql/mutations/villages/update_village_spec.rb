require 'rails_helper'

RSpec.describe 'update village mutation' do
  describe 'happy path' do
    it 'renames a village' do
      create_list(:village, 10)
      result = BackEndSchema.execute(valid_mutation(village_id: Village.first.id)).as_json

      expect(result["data"]["updateVillage"]["village"]["name"]).to eq("Camp Krusty")
    end
  end

  describe 'sad path' do
    it 'does not update if there isnt a village that matches the id' do
      result = BackEndSchema.execute(invalid_mutaion(village_id: 1)).as_json

      expect(result["errors"].first["message"]).to eq("Village does not exist.")
    end
  end

  def valid_mutation(village_id:)
    <<~GQL
    mutation {
      updateVillage(
        id: "#{village_id}"
        name: "Camp Krusty"
      )
      {
        village {
          name
        }
        errors
      }
    }
    GQL
  end

  def invalid_mutaion(village_id:)
    <<~GQL
    mutation {
      updateVillage(
        id: "#{village_id}"
        name: "Camp Krusty"
      )
      {
        village {
          name
        }
        errors
      }
    }
    GQL
  end
end

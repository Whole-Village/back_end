require 'rails_helper'

RSpec.describe 'query for one child by id' do
  describe 'happy path' do
    it 'finds the child with the matching id' do
      create(:user)
      create_list(:child, 5, user_id: User.first.id)

      result = BackEndSchema.execute(query(child_id: Child.first.id)).as_json

      expect(result["data"]["child"]["firstName"]).to eq(Child.first.first_name)
      expect(result["data"]["child"]["lastName"]).to eq(Child.first.last_name)
      expect(result["data"]["child"]["birthdate"]).to eq(Child.first.birthdate)
      expect(result["data"]["child"]["id"]).to eq(Child.first.id.to_s)
    end
  end

  describe 'sad path' do
    it 'returns an error when there is no child with the given ID' do
      result = BackEndSchema.execute(query(child_id: 1)).as_json

      expect(result["errors"].first["message"]).to eq("child does not exist.")
    end
  end

  describe 'edge case' do
    it 'retuns an error when a nil value is submitted for the child id' do
      result = BackEndSchema.execute(query(child_id: nil)).as_json

      expect(result["errors"].first["message"]).to eq("child does not exist.")
    end 
  end

  def query(child_id:)
    <<~GQL
    query {
      child(id: "#{child_id}"){
        firstName
        lastName
        birthdate
        id
      }
    }
    GQL
  end
end

require 'rails_helper'

RSpec.describe 'all children for a user query' do
  describe 'happy path' do
    it 'returns all the children for a user given an id' do
      create_list(:user, 5)
      user = User.first
      create_list(:child, 5, user_id: user.id)

      result = BackEndSchema.execute(query(user_id: user.id)).as_json

      result["data"]["children"].each do |child|
        expect(child["firstName"]).to be_a String
        expect(child["lastName"]).to be_a String
        expect(child["birthdate"]).to be_a String
      end
    end
  end

  describe 'sad path' do
    it 'returns an empty array when the user has no children' do
      create_list(:user, 5)
      user = User.first
      result = BackEndSchema.execute(query(user_id: user.id)).as_json

      expect(result["data"]["children"]).to be_empty
    end
  end

  describe 'edge path' do
    it 'returns an error when there is no user with the given id' do
      result = BackEndSchema.execute(query(user_id: 1)).as_json

      expect(result["errors"].first["message"]).to eq("user does not exist.")
    end
  end

  def query(user_id:)
    <<~GQL
    query {
      children(userId: "#{user_id}"){
        firstName
        lastName
        id
        birthdate
      }
    }
    GQL
  end
end

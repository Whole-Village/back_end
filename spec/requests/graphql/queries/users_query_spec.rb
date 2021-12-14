require 'rails_helper'

RSpec.describe 'all users endpoint', type: :request do
  describe 'happy path' do
    it 'returns the array of users' do
      create_list(:user, 10)
      result = BackEndSchema.execute(query).as_json

      result["data"]["users"].each do |user|
        expect(user["firstName"]).to be_a String
        expect(user["lastName"]).to be_a String
        expect(user["id"]).to be_a String
        expect(user["email"]).to be_a String
      end
    end
  end

  describe 'sad path' do
    it 'returns an empty array if no users' do
      result = BackEndSchema.execute(query).as_json
      expect(result["data"]["users"]).to be_empty
    end
  end

  def query
    <<~GQL
    query {
      users{
        firstName
        lastName
        email
        id
      }
    }
    GQL
  end
end

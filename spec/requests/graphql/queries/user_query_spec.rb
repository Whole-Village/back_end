require 'rails_helper'

RSpec.describe 'one user endpoint', type: :request do
  describe 'happy path' do
    it 'returns the user ' do
      users = create_list(:user, 10)

      user_email = users.first.email
      result = BackEndSchema.execute(query(user_email: user_email)).as_json

      expect(result["data"]["user"]["firstName"]).to eq(users.first.first_name)
      expect(result["data"]["user"]["lastName"]).to eq(users.first.last_name)
      expect(result["data"]["user"]["id"]).to eq(users.first.id.to_s)
      expect(result["data"]["user"]["email"]).to eq(users.first.email)
    end
  end
  describe 'sad path' do
    it 'does not successfully to execute if the user email is omitted' do
      users = create_list(:user, 10)

      result = BackEndSchema.execute(query(user_email: nil)).as_json

      expect(result["data"]).to be_falsey
      expect(result["errors"].first["message"]).to eq("Cannot return null for non-nullable field Query.user")
    end
  end

  def query(user_email:)
    <<~GQL
    query {
      user(email: "#{user_email}"){
        firstName
        lastName
        email
        id
      }
    }
    GQL
  end
end

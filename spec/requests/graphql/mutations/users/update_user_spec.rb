require 'rails_helper'

RSpec.describe 'update user mutation' do
  describe 'happy path' do
    it 'successfully updates a user' do
      user = create(:user)
      result = BackEndSchema.execute(valid_mutation(email: user.email)).as_json

      user.reload

      expect(result["data"]["updateUser"]["user"]["firstName"]).to eq("Homer")
      expect(user.first_name).to eq("Homer")
    end
  end

  describe 'sad path' do
    
  end

  describe 'edge case' do

  end

  def valid_mutation(email:)
    <<~GQL
    mutation {
      updateUser(
        email: "#{email}"
        firstName: "Homer"
        )
        {
        user {
          firstName
          lastName
          address
          email
          covidVaccinated
          phoneNumber
          id
        }
      }
    }
    GQL
  end
end

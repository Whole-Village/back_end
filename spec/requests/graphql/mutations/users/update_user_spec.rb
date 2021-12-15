require 'rails_helper'

RSpec.describe 'update user mutation' do
  describe 'happy path' do
    it 'successfully updates a user' do
      user = create(:user)
      result = BackEndSchema.execute(valid_mutation(email: User.first.email)).as_json

      user.reload

      expect(result["data"]["updateUser"]["user"]["firstName"]).to eq("Homer")
      expect(user.first_name).to eq("Homer")
    end
  end

  describe 'sad path' do
    it 'does not update when no user matches the email' do
      result = BackEndSchema.execute(no_match_mutation).as_json

      expect(result["errors"].first["message"]).to eq("User does not exist.")
    end
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

  def no_match_mutation
    <<~GQL
    mutation {
      updateUser(
        email: "nfoawnfoawnf"
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

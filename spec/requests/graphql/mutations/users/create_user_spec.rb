require 'rails_helper'

RSpec.describe 'create user mutation' do
  describe 'happy path' do
    it 'successfully creates a new user' do

      result = BackEndSchema.execute(valid_mutation).as_json

      expect(result["data"]["createUser"]["user"]["firstName"]).to eq(User.last.first_name)
      expect(result["data"]["createUser"]["user"]["lastName"]).to eq(User.last.last_name)
      expect(result["data"]["createUser"]["user"]["address"]).to eq(User.last.address)
      expect(result["data"]["createUser"]["user"]["email"]).to eq(User.last.email)
      expect(result["data"]["createUser"]["user"]["phoneNumber"]).to eq(User.last.phone_number)
    end
  end

  describe 'sad path' do
    it 'does not create a user if the email is already taken' do
      create(:user, email: "email@email.com")

      result = BackEndSchema.execute(email_taken_mutation).as_json

      expect(result["data"]["createUser"]["user"]).to be_falsey
      expect(result["data"]["createUser"]["errors"].first).to eq("Email has already been taken")
    end
  end

  describe 'edge case' do
    it 'does not create a user when there values are left nil' do
      result = BackEndSchema.execute(nil_mutation).as_json

      expect(result).to have_key "errors"
    end
  end

  def valid_mutation
    <<~GQL
    mutation {
      createUser(
        address: "123 Springfield drive"
        volunteerCredits: "0"
        firstName: "Homer"
        lastName: "Simpson"
        email: "homer@gmail.com"
        password: "donuts"
        covidVaccinated: true
        phoneNumber: "123456789"
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

  def email_taken_mutation
    <<~GQL
    mutation {
      createUser(
        address: "123 Springfield drive"
        volunteerCredits: "0"
        firstName: "Homer"
        lastName: "Simpson"
        email: "email@email.com"
        password: "donuts"
        covidVaccinated: true
        phoneNumber: "123456789"
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
        errors
      }
    }
    GQL
  end

  def nil_mutation
    <<~GQL
    mutation {
      createUser(
        address
        volunteerCredits: "0"
        firstName: "Homer"
        lastName: "Simpson"
        email
        password: "donuts"
        covidVaccinated: true
        phoneNumber: "123456789"
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
        errors
      }
    }
    GQL
  end
end

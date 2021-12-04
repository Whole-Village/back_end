require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'users' do
    let!(:users) { create_pair(:user) }

    let(:query) do
      %(query {
        users {
          firstName
          lastName
          email
          phoneNumber
          address
          covidVaccinated
          volunteerCredits
        }
      })
    end

    subject(:result) do
      BackEndSchema.execute(query).as_json
    end

    xit 'returns all users' do
      require pry;binding pry
      expect(result.dig('data', 'users')).to match_array(
        users.map { |user| { 'firstName' => user.firstName } }
      )
    end
  end
end

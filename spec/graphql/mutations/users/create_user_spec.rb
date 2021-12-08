require 'rails_helper'

RSpec.describe Mutations::Users::CreateUser, type: :request do
  before :each do
    @user = create(:user)

    post 'https://whole-village-be.herokuapp.com/graphql', params: { query: query(id: @user.id) }
  end

  context '.resolve' do
    it 'creates a user' do
      expect(response.status).to eq(200)
      expect(User.count).to eq(1)
    end

    xit 'returns a user' do
      json = JSON.parse(response.body)
      data = json['data']['createUser']

      expect(data).to include(
        'id'        => be_present,
        'firstName'=> user.first_name,
        'lastName' => user.last_name,
        'email'     => user.email,
        'address'   => user.address,
        'covidVaccinated' => user.covid_vaccinated,
        'volunteerCredits' => user.volunteer_credits
      )
    end

    xit 'throws an error if unable to create a user' do
    end

    def query(user_id)
      <<~GQL
        mutation {
          createUser(
            id: #{@user.id}
            firstName: #{@user.first_name}
            lastName: #{@user.last_name}
            email: #{@user.email},
            address: #{@user.address},
            covidVaccinated: #{@user.covid_vaccinated},
            volunteerCredits: #{@user.volunteer_credits}
          ) {
            id
            firstName
            lastName
            email
            address
            covidVaccinated
            volunteerCredits
          }
        }
      GQL
    end
  end
end

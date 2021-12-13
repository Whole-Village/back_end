require 'rails_helper'

RSpec.describe 'one user endpoint', type: :request do
  it 'returns the user ' do
    users = create_list(:user, 10)

    user_email = users.first.email
    post graphql_path, params: { query: query(user_email: user_email) }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]

  end

  def query(user_email:)
    <<~GQL
    query {
      user(email: "#{user_email}"){
        firstName
        lastName
      }
    }
    GQL
  end
end

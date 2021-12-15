require 'rails_helper'

RSpec.describe 'create village mutation' do
  describe 'happy path' do
    it 'successfully creates a village without members' do
      result = BackEndSchema.execute(valid_mutation).as_json

      expect(result["data"]["createVillage"]["village"]["name"]).to eq("springfield elementary")
      expect(result["data"]["createVillage"]["village"]["description"]).to eq("all the kids that go here")
      expect(result["data"]["createVillage"]["village"]["id"]).to eq(Village.last.id.to_s)
    end

    it 'successfully creats a message with members in the array' do
      users = create_list(:user, 10)
      email1 = users.first.email
      email2 = users.last.email

      result = BackEndSchema.execute(valid_mutation_emails(email1: email1, email2: email2)).as_json

      expect(result["data"]["createVillage"]["village"]["name"]).to eq("springfield elementary 2")
      expect(result["data"]["createVillage"]["village"]["description"]).to eq("all the kids that go here")
      expect(result["data"]["createVillage"]["village"]["id"]).to eq(Village.last.id.to_s)
      expect(result["data"]["createVillage"]["village"]["users"].first["email"]).to eq(email1)
      expect(result["data"]["createVillage"]["village"]["users"].last["email"]).to eq(email2)
    end
  end

  describe 'sad path' do
    it 'does not create a village if the name is omitted' do
      result = BackEndSchema.execute(bad_mutation).as_json

      expect(result["errors"].first["message"]).to eq("Argument 'name' on Field 'createVillage' has an invalid value (nil). Expected type 'String!'.")
    end
  end

  def valid_mutation
    <<~GQL
    mutation {
      createVillage(
        name: "springfield elementary"
        description: "all the kids that go here"
        userEmails: []
      )
      {
        village {
          name
          description
          id
        }
      }
    }
    GQL
  end

  def valid_mutation_emails(email1:, email2:)
    <<~GQL
    mutation {
      createVillage(
        name: "springfield elementary 2"
        description: "all the kids that go here"
        userEmails: ["#{email1}", "#{email2}"]
      )
      {
        village {
          name
          description
          id
          users {
            email
          }
        }
      }
    }
    GQL
  end
  def bad_mutation
    <<~GQL
    mutation {
      createVillage(
        name: nil
        description: "all the kids that go here"
        userEmails: []
      )
      {
        village {
          name
          description
          id
        }
      }
    }
    GQL
  end
end

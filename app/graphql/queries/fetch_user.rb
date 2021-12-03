module Queries
  class FetchUser < Queries::BaseQuery
    type [Types::UserType], null: false

    def resolve(email:)
      User.find_by(email)
    end
  end
end

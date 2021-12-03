module Queries
  class FetchUser < Queries::BaseQuery
    type [Types::UserType], null: false
    
  end
end

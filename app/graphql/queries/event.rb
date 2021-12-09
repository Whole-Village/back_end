class Queries::Event < Queries::BaseQuery
  type Types::EventType, null: false
    argument :id, ID, required: true
    # argument :village_id, ID, required: true

  def resolve(id:)
    Event.find(id)
  end
end

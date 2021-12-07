class Queries::Events < Queries::BaseQuery
  type [Types::EventType], null: false
    # description: "Fetch all events"
    argument :village_id, ID, required: true

  def resolve(village_id:)
    Village.find(village_id).events.all.order(date: :desc)
  end
end

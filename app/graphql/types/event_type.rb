class Types::EventType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: true
  field :description, String, null: true
  field :date, String, null: true
  field :time, String, null: true
  field :adult_required, Boolean, null: true
  field :village_id, ID, null: false
  field :village_name, String, null: false

  def village_id
    object.village.id
  end
    
  def village_name
    object.village.name
  end
end

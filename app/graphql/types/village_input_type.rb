module Types
  class VillageInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :description, String, required: false
  end
end

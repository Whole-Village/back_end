require 'rails_helper'

RSpec.describe BackEndSchema do
  it 'matches the dumped schema (rails graphql:schema:dump)' do
    aggregate_failures do
      expect(BackEndSchema.to_definition).to eq(File.read(Rails.root.join('schema.graphql')))
      expect(BackEndSchema.to_json).to eq(File.read(Rails.root.join('schema.json')).rstrip)
    end
  end
end

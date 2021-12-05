require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { should have_many(:village_events) }
    it { should have_many(:villages).through(:village_events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:adult_required) }
  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end

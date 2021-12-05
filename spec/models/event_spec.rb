require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { should have_many(:village_events) }
    it { should have_many(:villages).through(:village_events) }
  end

  describe 'validations' do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end

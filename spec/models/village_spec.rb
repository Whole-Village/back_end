require 'rails_helper'

RSpec.describe Village, type: :model do
  describe 'relationships' do
    it { should have_many(:village_members) }
    it { should have_many(:users).through(:village_members) }
    it { should have_many(:events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end

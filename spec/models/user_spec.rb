require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:village_members) }
    it { should have_many(:villages).through(:village_members) }
  end

  describe 'validations' do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end

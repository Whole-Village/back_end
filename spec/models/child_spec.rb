require 'rails_helper'

RSpec.describe Child, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:birthdate) }
  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end

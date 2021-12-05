require 'rails_helper'

RSpec.describe Child, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'validations' do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end 
end

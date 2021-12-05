require 'rails_helper'

RSpec.describe VillageEvent, type: :model do
  describe 'relationships' do
    it { should belong_to(:village) }
    it { should belong_to(:event) }
  end
end

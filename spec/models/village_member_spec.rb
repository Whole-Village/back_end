require 'rails_helper'

RSpec.describe VillageMember, type: :model do
  it { should belong_to(:village) }
  it { should belong_to(:user) }
end

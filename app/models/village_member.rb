class VillageMember < ApplicationRecord
  belongs_to :village
  belongs_to :user
end

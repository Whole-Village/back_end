class AddVillageToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :village, foreign_key: true
  end
end

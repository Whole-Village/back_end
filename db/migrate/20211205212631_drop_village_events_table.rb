class DropVillageEventsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :village_events
  end
end

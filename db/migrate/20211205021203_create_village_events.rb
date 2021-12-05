class CreateVillageEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :village_events do |t|
      t.references :village, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateVillageMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :village_members do |t|
      t.references :village, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

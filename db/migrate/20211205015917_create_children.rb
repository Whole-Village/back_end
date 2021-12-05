class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :birthdate

      t.timestamps
    end
  end
end

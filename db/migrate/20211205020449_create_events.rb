class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :description
      t.string :time
      t.boolean :adult_required
      t.string :images

      t.timestamps
    end
  end
end

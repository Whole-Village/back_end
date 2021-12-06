class AddDescriptionToVillages < ActiveRecord::Migration[6.1]
  def change
    add_column :villages, :description, :string
  end
end

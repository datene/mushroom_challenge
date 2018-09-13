class ChangeColumnNameHabitat < ActiveRecord::Migration[5.1]
  def change
    rename_column :mushrooms, :habtitat, :habitat
  end
end

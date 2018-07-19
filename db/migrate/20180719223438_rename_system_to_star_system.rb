class RenameSystemToStarSystem < ActiveRecord::Migration[5.2]
  def change
    rename_table :systems, :star_systems
    rename_column :stations, :system_id, :star_system_id
  end
end

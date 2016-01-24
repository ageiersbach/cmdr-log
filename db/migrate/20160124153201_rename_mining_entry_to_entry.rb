class RenameMiningEntryToEntry < ActiveRecord::Migration
  def change
    rename_table :mining_entries, :entries
    rename_column :extracted_resources, :mining_entry_id, :entry_id
  end
end

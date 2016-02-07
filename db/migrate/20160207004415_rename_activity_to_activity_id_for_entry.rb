class RenameActivityToActivityIdForEntry < ActiveRecord::Migration
  def change
    rename_column :entries, :activity, :activity_id
    Entry.reset_column_information
    Entry.update_all(activity_id: 1) # All entries up to this point have been "Mining" entries
  end
end

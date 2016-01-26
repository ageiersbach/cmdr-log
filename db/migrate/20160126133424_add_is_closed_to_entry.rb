class AddIsClosedToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :is_closed, :boolean, null: false, default: false
  end
end

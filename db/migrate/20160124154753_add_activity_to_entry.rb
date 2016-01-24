class AddActivityToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :activity, :integer, default: 0
  end
end

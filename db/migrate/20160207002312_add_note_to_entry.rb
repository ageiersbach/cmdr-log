class AddNoteToEntry < ActiveRecord::Migration
  def change
    add_reference :entries, :note, index: true, foreign_key: true
  end
end

class AddLocationToCommander < ActiveRecord::Migration[5.2]
  def change
    add_reference :commanders, :location, polymorphic: true, index: true
  end
end

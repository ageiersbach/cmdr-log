class RemoveLocationFromCommanders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :commanders, :location, polymorphic: true, index: true
  end
end

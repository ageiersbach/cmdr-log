class AddCoordinatesToSystem < ActiveRecord::Migration
  def change
    add_column :systems, :x, :float
    add_column :systems, :y, :float
    add_column :systems, :z, :float
  end
end

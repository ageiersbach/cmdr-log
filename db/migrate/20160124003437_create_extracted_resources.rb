class CreateExtractedResources < ActiveRecord::Migration
  def change
    create_table :extracted_resources do |t|
      t.references :commodity, index: true, foreign_key: true
      t.references :mining_entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

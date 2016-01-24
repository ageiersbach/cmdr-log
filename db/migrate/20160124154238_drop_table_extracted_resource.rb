class DropTableExtractedResource < ActiveRecord::Migration
  def change
    drop_table :extracted_resources
  end
end

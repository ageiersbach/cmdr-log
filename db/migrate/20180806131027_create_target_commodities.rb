class CreateTargetCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :target_commodities do |t|
      t.references :commodity, foreign_key: true
      t.references :mission_log_target, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end

class AddTokenToCommander < ActiveRecord::Migration[5.2]
  def change
    add_column :commanders, :token, :string
    add_column :commanders, :token_expiration, :datetime
    add_index :commanders, :token, unique: true
  end
end

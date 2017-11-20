class CreateConnectHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :connect_histories do |t|
      t.integer :user_id, null: false
      t.integer :user_id, null: false
      t.integer :pair_image_id, null: false
      t.timestamps
    end
  end
end

class CreateConnectHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :connect_histories do |t|
      t.integer :own_user_id, null: false
      t.integer :yours_user_id, null: false
      t.integer :pair_image_id
      t.timestamps
    end
  end
end

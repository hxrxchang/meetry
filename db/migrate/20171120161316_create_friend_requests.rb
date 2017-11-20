class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.integer :friend_id, null: false
      t.integer :request_user_id, null: false
      t.integer :request_status, default: 0
      t.timestamps
    end
  end
end

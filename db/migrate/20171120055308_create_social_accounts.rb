class CreateSocialAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :social_accounts do |t|
      t.integer :user_id
      t.string :provider
      t.string :url
      t.timestamps
    end
  end
end

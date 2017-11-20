class CreateUserInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_informations do |t|
      t.integer :user_id
      t.integer :tel
      t.string :gmail
      t.timestamps
    end
  end
end

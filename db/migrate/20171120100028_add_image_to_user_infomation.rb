class AddImageToUserInfomation < ActiveRecord::Migration[5.1]
  def change
    add_column :user_informations, :image, :string
  end
end

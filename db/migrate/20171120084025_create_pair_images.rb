class CreatePairImages < ActiveRecord::Migration[5.1]
  def change
    create_table :pair_images do |t|
      t.string :image
      t.timestamps
    end
  end
end

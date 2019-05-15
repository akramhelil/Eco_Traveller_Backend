class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :trip_id, foregin_key: true
      t.string :title
      t.integer :likes
      t.string :content
      t.string :img_url

      t.timestamps
    end
  end
end

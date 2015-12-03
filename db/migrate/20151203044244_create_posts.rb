class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :link_youtube
      t.text :link_img
      t.text :description

      t.timestamps null: false
    end
  end
end

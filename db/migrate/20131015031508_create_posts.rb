class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :parent_id
      t.text :content
      t.string :entity_type

      t.timestamps
    end
  end
end

class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :subject
      t.text :content
      t.boolean :read, :default => 0

      t.timestamps
    end
  end
end

class AddAttachmentImagePathToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image_path
    end
  end

  def self.down
    drop_attached_file :users, :image_path
  end
end

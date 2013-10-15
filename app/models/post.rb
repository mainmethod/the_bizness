class Post < ActiveRecord::Base
  attr_accessible :content, :entity_type, :parent_id, :user_id
  
  belongs_to :user
  has_many :comments, :class_name => "Post", :foreign_key => :parent_id
  belongs_to :post, :foreign_key => :parent_id
  
  scope :recent, order('posts.created_at DESC')
end

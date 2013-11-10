class Comment < ActiveRecord::Base
  
  attr_accessible :content
  
  self.table_name = 'posts'
  
  belongs_to :post, :foreign_key => :parent_id
  belongs_to :user
  
  default_scope where('posts.parent_id<>0')
  scope :recent, includes(:user).order('posts.created_at DESC')
  
end
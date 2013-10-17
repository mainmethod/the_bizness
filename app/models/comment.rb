class Comment < Post
  
  table_name = 'posts'
  
  belongs_to :post
  
  self.default_scopes = []
  default_scope where('posts.parent_id<>0')
  scope :recent, oder('posts.created_at DESC')
  
end
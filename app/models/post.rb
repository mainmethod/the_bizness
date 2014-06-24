class Post < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, :foreign_key => :parent_id
  
  default_scope { where("posts.parent_id=0") }
  scope :recent, -> { includes(:user).order('posts.created_at DESC') }
  scope :except_me, ->(current_user){
    where("posts.user_id <> ?",current_user.id)
  }
end

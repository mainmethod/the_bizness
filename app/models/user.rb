class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :first_name, :last_name, :image_path, :birthday, :about, :location_attributes
  
  has_many :relationships, :foreign_key => :follower_id, :class_name => 'Relationship', :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => :followed_id, :class_name => 'Relationship', :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  belongs_to :location
  has_many :posts
    
  accepts_nested_attributes_for :location
  
  has_attached_file :image_path, :styles => {
    :thumb => '100x100>',
    :profile => '200x200>'
  }
  
  scope :except_me, lambda{|current_user|
    where("id <> ?",current_user.id)  
  }
  
  def following?(other_user)
    followed_users.exists?(other_user)
  end
  
  def follow!(other_user)
    followed_users << other_user if !following?(other_user)
  end
  
  def unfollow!(other_user)
    followed_users.delete(other_user)
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
end

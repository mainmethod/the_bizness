class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :first_name, :last_name, :image_path, :birthday, :about, :location_attributes, :location_id
                    
  has_and_belongs_to_many :jobs, :join_table => 'users_jobs'
  has_many :relationships, :foreign_key => :follower_id, :class_name => 'Relationship', :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => :followed_id, :class_name => 'Relationship', :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  has_many :messages, :foreign_key => :recipient_id
  has_many :sent_messages, :class_name => 'Message', :foreign_key => :sender_id
  belongs_to :location
  has_many :posts
    
  accepts_nested_attributes_for :location
  
  has_attached_file :image_path, :styles => {
    :thumb => '100x100#',
    :profile => '200x200#'
  }
  
  scope :except_me, lambda{|current_user|
    where("id <> ?",current_user.id)  
  }
  
  scope :search, lambda{|term|
    where("LOWER(first_name) like LOWER(?) or LOWER(last_name) like LOWER(?)","%#{term}%","%#{term}%"). \
    order("(first_name LIKE '%#{term}%') DESC, LENGTH(first_name) ASC, first_name ASC") 
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
  
  def subtitle
    jobs.first.title if jobs.first
  end
  
  def followers_count
    followers.count
  end
  
  def followed_count
    followed_users.count
  end
  
  def location_attributes=(attributes)
    self.location = Location.find_or_create_by_city_and_state(attributes[:city],attributes[:state])
  end
end

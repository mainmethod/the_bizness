class Message < ActiveRecord::Base
  attr_accessible :content, :recipient_id, :sender_id, :subject
  
  belongs_to :sender, :class_name => 'User', :foreign_key => :sender_id
  belongs_to :recipient, :class_name => 'User', :foreign_key => :recipient_id
  
  scope :unread, where(:read => 0)
end

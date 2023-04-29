class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
  
    has_many :active_follows, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy
    has_many :following, through: :active_follows, source: :followed
  
    has_many :passive_follows, class_name: "Follow", foreign_key: :followed_id, dependent: :destroy
    has_many :followers, through: :passive_follows, source: :follower
  
    has_many :sent_notifications, class_name: "Notification", foreign_key: :sender_id, dependent: :destroy
    has_many :received_notifications, class_name: "Notification", foreign_key: :recipient_id, dependent: :destroy
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end
  
class User < ActiveRecord::Base
  has_one :spec
  has_many :friendship



  has_many :friends,
           :through => :friendships,
           :conditions => "status = 'accepted'",
           :order => :screen_name

  has_many :requested_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'requested'",
           :order => :created_at

  has_many :pending_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'pending'",
           :order => :created_at

  has_many :microposts, dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed



  has_many :reverse_relationships, foreign_key: "followed_id",
           class_name:  "Relationship",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower



  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me



  # attr_accessible :title, :body

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

end

class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation,:department_ids

  has_one :spec , dependent: :destroy
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
  devise :omniauthable #:omniauth_providers => [:facebook,:linkedin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :remember_me ,:provider,:uid



  #this is for communities
  has_many :memberships , dependent: :destroy
  has_many :communities, :through => :memberships


  has_many :user_departships
  has_many :departments,through: :user_departships


  # attr_accessible :title, :body

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.new(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

   def join(community)
     memberships.new(community_id:community.id)
   end

  def unjoin(community)
    memberships.find_by_community_id(community.id).destroy
  end

  def joined?(community)
    memberships.find_by_community_id(community.id)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    #unless user
      #user = User.create(#first_name:auth.extra.raw_info.name,
          #               provider:auth.provider,
         #                uid:auth.uid,
        #                 email:auth.info.email,
       #                  password:Devise.friendly_token[0,20]
      #)

      #user.spec ||= Spec.create( remote_image_url:auth.extra.raw_info.image)


    #end
    user
  end



  def self.find_for_linkedin_oauth(auth,signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    user
  end

  def new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        #user.spec.first_name = data["name"] if user.spec.first_name.blank?
        #user.spec ||= Spec.new
        #user.spec.first_name = "hello" if user.spec.first_name.blank?

      end
    end
  end





end

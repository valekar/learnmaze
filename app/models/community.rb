class Community < ActiveRecord::Base
  attr_accessible :name,:community_image,:remote_community_image_url

  has_many :memberships
  has_many :users, :through => :memberships

  has_many :departmentships
  has_many :departments, :through => :departmentships

 mount_uploader :community_image,CommunityImageUploader


end

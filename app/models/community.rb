class Community < ActiveRecord::Base
  attr_accessible :name,:community_image,:remote_community_image_url,:department_tokens

  has_many :memberships
  has_many :users, :through => :memberships

  has_many :departmentships
  has_many :departments, :through => :departmentships

 mount_uploader :community_image,CommunityImageUploader
  attr_reader :department_tokens

  def department_tokens=(ids)
    self.department_ids = ids.split(",")
  end
end

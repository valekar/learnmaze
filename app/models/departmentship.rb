class Departmentship < ActiveRecord::Base
  attr_accessible :community_id
  belongs_to :community
  belongs_to :department
  # attr_accessible :title, :body
end

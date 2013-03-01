class Department < ActiveRecord::Base
  attr_accessible :description, :name,:community_ids

  has_many :departmentships
  has_many :communities,through: :departmentships

  has_many :user_departships
  has_many :users ,through: :user_departships

end

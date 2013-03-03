class Department < ActiveRecord::Base
  attr_accessible :description, :name,:community_ids,:community_token



  has_many :departmentships
  has_many :communities,through: :departmentships

  has_many :user_departships
  has_many :users ,through: :user_departships



  attr_reader :community_token
  def community_token=(ids)
      self.community_ids = ids.split(",")
  end

end

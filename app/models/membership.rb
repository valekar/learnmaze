class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :community
  attr_accessible :status , :community_id
end

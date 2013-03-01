class Spec < ActiveRecord::Base

  belongs_to :user
  attr_accessible :birthdate, :college, :first_name, :gender, :image, :interest, :last_name, :user_id,:remote_image_url

  mount_uploader :image,ImageUploader

  searchable do
    text :college,:interest,:first_name
  end


  ALL_FIELDS = %w(first_last last_name gender birthday interest college)
  STRING_FIELDS = %(first_name last_name interest college)
  VALID_GENDERS =["Male","Female"]
  START_YEAR = 1900
  VALID_DATES = DateTime.new(START_YEAR)..DateTime.now


  validates_inclusion_of :gender,
                         :in => VALID_GENDERS,
                         :allow_nil => true,
                         :message => "Must be a male or Female"


  validates_inclusion_of :birthdate,
                         :in => VALID_DATES,
                         :allow_nil => true,
                         :message => "Is Invalid"


  def self.find_user(result)
        where(interest:result)||where(college:result)||where(first_name:result).pluck(:id)

  end


end

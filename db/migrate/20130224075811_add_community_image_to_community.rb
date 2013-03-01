class AddCommunityImageToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :community_image, :string
  end
end

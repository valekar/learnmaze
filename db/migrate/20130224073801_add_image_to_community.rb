class AddImageToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :image, :string
  end
end

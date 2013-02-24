class AddDescriptionToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :description, :text
  end
end

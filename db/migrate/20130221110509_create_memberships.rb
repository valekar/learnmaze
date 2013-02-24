class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :user
      t.belongs_to :community
      t.string :status

      t.timestamps
    end
    add_index :memberships, :user_id
    add_index :memberships, :community_id
  end
end

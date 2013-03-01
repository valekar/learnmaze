class CreateUserDepartships < ActiveRecord::Migration
  def change
    create_table :user_departships do |t|
      t.belongs_to :user
      t.belongs_to :department

      t.timestamps
    end
    add_index :user_departships, :user_id
    add_index :user_departships, :department_id
  end
end

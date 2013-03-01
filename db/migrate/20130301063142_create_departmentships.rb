class CreateDepartmentships < ActiveRecord::Migration
  def change
    create_table :departmentships do |t|
      t.belongs_to :community
      t.belongs_to :department

      t.timestamps
    end
    add_index :departmentships, :community_id
    add_index :departmentships, :department_id
  end
end

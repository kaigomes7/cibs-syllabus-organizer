class AddIsAdminToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :isAdmin, :bool
  end
end

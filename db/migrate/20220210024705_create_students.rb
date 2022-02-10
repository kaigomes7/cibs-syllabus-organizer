class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :student_email
      t.integer :tamu_department_id
      t.string :student_name

      t.timestamps
    end
  end
end

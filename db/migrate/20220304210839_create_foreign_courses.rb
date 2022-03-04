class CreateForeignCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses do |t|
      t.integer :tamu_department_id
      t.string :foreign_course_name
      t.integer :contact_hours
      t.string :semester_approved
      t.string :foreign_course_dept
      t.integer :foreign_course_num
      t.boolean :course_approval_status

      t.timestamps
    end
    add_index :foreign_courses, :tamu_department_id
  end
end

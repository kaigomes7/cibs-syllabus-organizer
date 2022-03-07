class CreateForeignCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses do |t|
      t.string :foreign_course_name
      t.integer :contact_hours
      t.string :semester_approved
      t.references :tamu_department, null: false, foreign_key: true
      t.references :university, null: false, foreign_key: true
      t.integer :foreign_course_num
      t.string :foreign_course_dept
      t.boolean :course_approval_status

      t.timestamps
    end
  end
end

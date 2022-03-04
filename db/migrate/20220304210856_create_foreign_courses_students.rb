class CreateForeignCoursesStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses_students do |t|
      t.references :foreign_course, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.boolean :admin_course_approval
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

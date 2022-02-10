class CreateForeignCoursesTamuCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses_tamu_courses do |t|
      t.integer :foreign_course_id
      t.integer :tamu_course_id

      t.timestamps
    end
  end
end

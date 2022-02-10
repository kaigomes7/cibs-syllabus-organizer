class CreateForeignCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses do |t|
      t.string :instrutor
      t.integer :tamu_department_id
      t.string :foreign_course_name
      t.integer :credit_hours
      t.integer :university_id
      t.string :semester_approved

      t.timestamps
    end
  end
end

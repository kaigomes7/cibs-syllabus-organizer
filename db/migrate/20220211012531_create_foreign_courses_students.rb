class CreateForeignCoursesStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses_students do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :foreign_course, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateForeignCoursesTamuCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses_tamu_courses do |t|
      t.belongs_to :foreign_course, null: false, foreign_key: true
      t.belongs_to :tamu_course, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class AddForeignCourseNumToForeignCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :foreign_courses, :foreign_course_num, :string
  end
end

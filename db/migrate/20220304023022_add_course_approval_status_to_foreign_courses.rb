class AddCourseApprovalStatusToForeignCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :foreign_courses, :course_approval_status, :boolean
  end
end

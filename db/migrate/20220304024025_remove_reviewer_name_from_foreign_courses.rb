class RemoveReviewerNameFromForeignCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :foreign_courses, :reviwer_name, :string
  end
end

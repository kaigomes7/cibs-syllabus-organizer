class AddReviewerNameToForeignCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :foreign_courses, :reviwer_name, :string
  end
end

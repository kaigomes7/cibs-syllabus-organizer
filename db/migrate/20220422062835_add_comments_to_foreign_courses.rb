# frozen_string_literal: true

class AddCommentsToForeignCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :foreign_courses, :comments, :text
  end
end

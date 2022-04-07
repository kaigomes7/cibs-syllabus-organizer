# frozen_string_literal: true

class CreateForeignCoursesTamuCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses_tamu_courses do |t|
      t.references :foreign_course, null: false, foreign_key: true
      t.references :tamu_course, null: false, foreign_key: true

      t.timestamps
    end
  end
end

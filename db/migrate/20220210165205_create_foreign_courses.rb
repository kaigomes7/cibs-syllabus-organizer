# frozen_string_literal: true

class CreateForeignCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses do |t|
      t.string :instructor
      t.string :foreign_course_name
      t.integer :credit_hours
      t.string :semester_approved
      t.belongs_to :tamu_department, null: false, foreign_key: true
      t.belongs_to :university, null: false, foreign_key: true

      t.timestamps
    end
  end
end

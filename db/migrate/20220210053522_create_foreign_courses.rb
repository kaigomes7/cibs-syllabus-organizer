class CreateForeignCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_courses do |t|
      t.string :instrutor
      t.belongs_to :tamu_department, null: false, foreign_key: true
      t.string :foreign_course_name
      t.integer :credit_hours
      t.belongs_to :university, null: false, foreign_key: true
      t.string :semester_approved

      t.timestamps
    end
  end
end

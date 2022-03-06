class CreateTamuCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :tamu_courses do |t|
      t.integer :course_num
      t.references :tamu_department, null: false, foreign_key: true
      t.string :course_name

      t.timestamps
    end
  end
end

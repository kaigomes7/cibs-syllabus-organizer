class CreateTamuCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :tamu_courses do |t|
      t.integer :tamu_department_id
      t.integer :course_num

      t.timestamps
    end
  end
end

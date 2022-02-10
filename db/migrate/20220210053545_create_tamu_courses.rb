class CreateTamuCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :tamu_courses do |t|
      t.belongs_to :tamu_department, null: false, foreign_key: true
      t.integer :course_num

      t.timestamps
    end
  end
end

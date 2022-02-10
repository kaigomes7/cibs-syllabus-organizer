class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :student_email
      t.belongs_to :tamu_department, null: false, foreign_key: true
      t.string :student_name

      t.timestamps
    end
  end
end

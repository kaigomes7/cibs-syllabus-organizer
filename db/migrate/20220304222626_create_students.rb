class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.references :tamu_department, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :tamu_major
      t.string :tamu_college
      t.string :classification

      t.timestamps
    end
  end
end

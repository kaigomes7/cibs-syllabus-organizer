class CreateTamuDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :tamu_departments do |t|
      t.string

      t.timestamps
    end
  end
end
# frozen_string_literal: true

class CreateTamuDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :tamu_departments do |t|
      t.string :tamu_department_name

      t.timestamps
    end
  end
end

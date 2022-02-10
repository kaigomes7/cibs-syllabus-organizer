class CreateUniversities < ActiveRecord::Migration[6.1]
  def change
    create_table :universities do |t|
      t.string :country
      t.string :university_name

      t.timestamps
    end
  end
end

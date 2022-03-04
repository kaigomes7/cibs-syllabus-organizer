class CreateReviewers < ActiveRecord::Migration[6.1]
  def change
    create_table :reviewers do |t|
      t.references :tamu_department, null: false, foreign_key: true
      t.references :user

      t.timestamps
    end
  end
end

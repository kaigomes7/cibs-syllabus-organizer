class CreateReviewers < ActiveRecord::Migration[6.1]
  def change
    create_table :reviewers do |t|
      t.string :reviewer_email
      t.integer :tamu_department_id

      t.timestamps
    end
  end
end

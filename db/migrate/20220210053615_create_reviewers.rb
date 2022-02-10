class CreateReviewers < ActiveRecord::Migration[6.1]
  def change
    create_table :reviewers do |t|
      t.string :reviewer_email
      t.belongs_to :tamu_department, null: false, foreign_key: true

      t.timestamps
    end
  end
end

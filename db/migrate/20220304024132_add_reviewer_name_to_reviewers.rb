class AddReviewerNameToReviewers < ActiveRecord::Migration[6.1]
  def change
    add_column :reviewers, :reviewer_name, :string
  end
end

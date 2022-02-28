class Reviewer < ApplicationRecord
  validates :reviewer_email, :tamu_department_id, presence: true
  belongs_to :tamu_department
end
